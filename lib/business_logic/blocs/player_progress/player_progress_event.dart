import 'package:equatable/equatable.dart';

class PlayerProgressEvent extends Equatable {
  final double value;
  final double max;
  const PlayerProgressEvent({required this.value, required this.max});

  @override
  List<Object> get props => [];
}

class PlayerProgressChange extends PlayerProgressEvent {
  const PlayerProgressChange({required super.value, required super.max});
}

class PlayerProgressFinish extends PlayerProgressEvent {
  const PlayerProgressFinish({required super.value, required super.max});
}
