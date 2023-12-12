import 'package:equatable/equatable.dart';

class VolumeEvent extends Equatable {
  final bool isMuted;

  const VolumeEvent({this.isMuted = false});

  @override
  List<Object> get props => [isMuted];
}

class VolumeSliderEvent extends VolumeEvent {
  final double volume;

  const VolumeSliderEvent({required this.volume, super.isMuted = false});

  @override
  List<Object> get props => [volume, isMuted];
}

class VolumeSliderChange extends VolumeSliderEvent {
  const VolumeSliderChange({required double volume}) : super(volume: volume);
}

class VolumeSliderFinish extends VolumeSliderEvent {
  const VolumeSliderFinish({required double volume}) : super(volume: volume);
}

class VolumeMuteToggle extends VolumeEvent {
  const VolumeMuteToggle() : super();
}
