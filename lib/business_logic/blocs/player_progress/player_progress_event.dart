import 'package:equatable/equatable.dart';

class PlayerProgressEvent extends Equatable {
  final double value;
  final double max;
  const PlayerProgressEvent({required this.value, required this.max});

  @override
  List<Object> get props => [value, max];
}

class PlayerProgressChange extends PlayerProgressEvent {
  final bool isDragging;

  const PlayerProgressChange({
    required super.value,
    required super.max,
    required this.isDragging,
  });

  @override
  List<Object> get props => super.props..add(isDragging);
}

class PlayerProgressFinish extends PlayerProgressEvent {
  const PlayerProgressFinish({required super.value, required super.max});
}
