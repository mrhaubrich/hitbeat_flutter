import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ShuffleButtonState extends Equatable {
  final bool isShuffled;

  const ShuffleButtonState({this.isShuffled = false});

  @override
  List<Object> get props => [isShuffled];

  Color getColor(BuildContext context);

  factory ShuffleButtonState.fromBoolean(bool isShuffled) {
    return isShuffled
        ? const ShuffleButtonActive()
        : const ShuffleButtonInactive();
  }
}

class ShuffleButtonActive extends ShuffleButtonState {
  const ShuffleButtonActive() : super(isShuffled: true);

  @override
  Color getColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }
}

class ShuffleButtonInactive extends ShuffleButtonState {
  const ShuffleButtonInactive() : super(isShuffled: false);

  @override
  Color getColor(BuildContext context) {
    return Colors.white60;
  }
}
