import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/volume_slider/volume_slider_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/volume_slider/volume_slider_state.dart';

class VolumeSliderBloc extends Bloc<VolumeEvent, VolumeSliderState> {
  VolumeSliderBloc() : super(const VolumeSliderInitial()) {
    on<VolumeSliderChange>(_onVolumeSliderChange);
    on<VolumeSliderFinish>(_onVolumeSliderFinish);
    on<VolumeMuteToggle>(_onVolumeMuteToggle);
  }

  void _onVolumeSliderChange(
      VolumeSliderChange event, Emitter<VolumeSliderState> emit) {
    emit(VolumeSliderChanged(volume: event.volume));
  }

  void _onVolumeSliderFinish(
      VolumeSliderFinish event, Emitter<VolumeSliderState> emit) {
    emit(VolumeSliderEnd(volume: event.volume));
  }

  void _onVolumeMuteToggle(
      VolumeMuteToggle event, Emitter<VolumeSliderState> emit) {
    emit(VolumeSliderChanged(volume: state.volume, isMuted: !state.isMuted));
  }
}
