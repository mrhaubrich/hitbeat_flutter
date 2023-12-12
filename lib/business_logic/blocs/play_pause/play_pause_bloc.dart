import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/play_pause/play_pause_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/play_pause/play_pause_state.dart';

class PlayPauseButtonBloc
    extends Bloc<PlayPauseButtonEvent, PlayPauseButtonState> {
  PlayPauseButtonBloc() : super(const PlayPauseButtonState(false)) {
    on<PlayPauseButtonToggle>((event, emit) {
      emit(PlayPauseButtonState(!state.isPlaying));
    });
  }
}
