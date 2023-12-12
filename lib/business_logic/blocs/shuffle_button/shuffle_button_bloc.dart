import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/shuffle_button/shuffle_button_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/shuffle_button/shuffle_button_state.dart';

class ShuffleButtonBloc extends Bloc<ShuffleButtonEvent, ShuffleButtonState> {
  ShuffleButtonBloc() : super(const ShuffleButtonInactive()) {
    on<ShuffleButtonToggle>((event, emit) {
      emit(ShuffleButtonState.fromBoolean(!state.isShuffled));
    });
  }
}
