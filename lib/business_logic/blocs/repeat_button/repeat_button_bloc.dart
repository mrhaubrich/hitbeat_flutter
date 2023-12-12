import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_state.dart';

class RepeatButtonBloc extends Bloc<RepeatButtonEvent, RepeatButtonState> {
  RepeatButtonBloc() : super(_order.first) {
    on<RepeatButtonToggle>((event, emit) {
      emit(_nextState);
    });
  }

  static final List<RepeatButtonState> _order = [
    RepeatButtonNone(),
    RepeatButtonOne(),
    RepeatButtonAll(),
  ];

  RepeatButtonState get _nextState {
    int indexOfCurrent = _order.indexOf(state);
    if (indexOfCurrent == _order.length - 1) {
      indexOfCurrent = 0;
    } else {
      indexOfCurrent++;
    }

    return _order[indexOfCurrent];
  }
}
