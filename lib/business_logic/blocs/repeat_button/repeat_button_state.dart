import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/business_logic/repeat_mode.dart';

abstract class RepeatButtonState {
  abstract final IconData iconData;

  RepeatMode repeatMode;

  RepeatButtonState(this.repeatMode);

  Color getColor(BuildContext context);

  factory RepeatButtonState.fromRepeatMode(RepeatMode repeatMode) {
    switch (repeatMode) {
      case RepeatMode.none:
        return RepeatButtonNone();
      case RepeatMode.one:
        return RepeatButtonOne();
      case RepeatMode.all:
        return RepeatButtonAll();
      default:
        throw Exception('Invalid repeat mode');
    }
  }
}

class RepeatButtonNone extends RepeatButtonState {
  RepeatButtonNone() : super(RepeatMode.none);

  @override
  final IconData iconData = Icons.repeat_outlined;

  final Color _iconColor = Colors.white60;

  @override
  Color getColor(BuildContext context) {
    return _iconColor;
  }
}

abstract class _RepeatButtonActive extends RepeatButtonState {
  _RepeatButtonActive(super.repeatMode);

  @override
  Color getColor(BuildContext context) => Theme.of(context).primaryColor;
}

class RepeatButtonOne extends _RepeatButtonActive {
  RepeatButtonOne() : super(RepeatMode.one);

  @override
  final IconData iconData = Icons.repeat_one_outlined;
}

class RepeatButtonAll extends _RepeatButtonActive {
  RepeatButtonAll() : super(RepeatMode.all);

  @override
  final IconData iconData = Icons.repeat_rounded;
}
