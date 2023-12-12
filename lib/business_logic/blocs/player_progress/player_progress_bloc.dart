import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_state.dart';
import 'package:hitbeat_flutter/business_logic/player/player.dart';

class PlayerProgressBloc
    extends Bloc<PlayerProgressEvent, PlayerProgressState> {
  final Player player;

  StreamSubscription? _positionSubscription;

  PlayerProgressBloc({
    required double max,
    required this.player,
  }) : super(PlayerProgressInitial(max: max)) {
    _positionSubscription = player.positionStream.listen((event) {
      handler(event, max);
    });

    on<PlayerProgressChange>((event, emit) {
      if (event.isDragging) {
        _positionSubscription?.cancel();
      }
      emit(PlayerProgressChanged(value: event.value, max: event.max));
    });

    on<PlayerProgressFinish>((event, emit) {
      final duration = Duration(seconds: event.value.toInt());
      player.seek(duration);
      emit(PlayerProgressEnd(value: event.value, max: event.max));
      _positionSubscription = player.positionStream.listen((event) {
        handler(event, max);
      });
    });
  }

  void handler(Duration? event, double max) {
    add(
      PlayerProgressChange(
        value: event?.inSeconds.toDouble() ?? 0,
        max: max,
        isDragging: false,
      ),
    );
  }
}
