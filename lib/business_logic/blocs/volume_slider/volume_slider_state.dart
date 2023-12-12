import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class VolumeSliderState extends Equatable {
  final double volume;
  final bool isMuted;

  const VolumeSliderState({required this.volume, this.isMuted = false});

  @override
  List<Object> get props => [volume, isMuted];

  IconData get volumeIcon {
    if (volume == 0) {
      return Icons.volume_off_rounded;
    } else if (volume < 50) {
      return Icons.volume_down_rounded;
    } else {
      return Icons.volume_up_rounded;
    }
  }
}

class VolumeSliderInitial extends VolumeSliderState {
  const VolumeSliderInitial() : super(volume: 50);
}

class VolumeSliderChanged extends VolumeSliderState {
  const VolumeSliderChanged({required super.volume, super.isMuted});
}

class VolumeSliderEnd extends VolumeSliderState {
  const VolumeSliderEnd({required super.volume, super.isMuted});
}
