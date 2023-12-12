import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_state.dart';
import 'package:hitbeat_flutter/business_logic/repeat_mode.dart';

class RepeatButtonBloc extends Bloc<RepeatButtonEvent, RepeatButtonState> {
  RepeatButtonBloc() : super(RepeatButtonNone()) {
    on<RepeatButtonToggle>((event, emit) {
      emit(RepeatButtonState.fromRepeatMode(_nextRepeatMode));
    });
  }

  RepeatMode get _nextRepeatMode {
    final nextIndex = RepeatMode.values.indexOf(state.repeatMode) + 1;
    return RepeatMode.values[nextIndex % RepeatMode.values.length];
  }
}
