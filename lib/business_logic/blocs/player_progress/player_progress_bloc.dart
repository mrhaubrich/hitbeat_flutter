import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_state.dart';

class PlayerProgressBloc
    extends Bloc<PlayerProgressEvent, PlayerProgressState> {
  PlayerProgressBloc({required double max})
      : super(PlayerProgressInitial(max: max)) {
    on<PlayerProgressChange>((event, emit) {
      emit(PlayerProgressChanged(value: event.value, max: event.max));
    });

    on<PlayerProgressFinish>((event, emit) {
      emit(PlayerProgressEnd(value: event.value, max: event.max));
    });
  }
}
