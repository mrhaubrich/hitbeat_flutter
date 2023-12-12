import 'package:equatable/equatable.dart';

class PlayerProgressState extends Equatable {
  final double value;
  final double max;

  const PlayerProgressState({
    required this.value,
    required this.max,
  });

  @override
  List<Object?> get props => [value];
}

class PlayerProgressInitial extends PlayerProgressState {
  const PlayerProgressInitial({required super.max}) : super(value: 0);
}

class PlayerProgressChanged extends PlayerProgressState {
  const PlayerProgressChanged({required super.value, required super.max});
}

class PlayerProgressEnd extends PlayerProgressState {
  const PlayerProgressEnd({required super.value, required super.max});
}
