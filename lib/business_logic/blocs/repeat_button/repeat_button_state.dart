import 'package:flutter/material.dart';

abstract class RepeatButtonState {
  abstract final IconData iconData;

  Color getColor(BuildContext context);
}

class RepeatButtonNone extends RepeatButtonState {
  @override
  final IconData iconData = Icons.repeat_outlined;

  final Color _iconColor = Colors.white60;

  @override
  Color getColor(BuildContext context) {
    return _iconColor;
  }
}

abstract class _RepeatButtonActive extends RepeatButtonState {
  @override
  Color getColor(BuildContext context) => Theme.of(context).primaryColor;
}

class RepeatButtonOne extends _RepeatButtonActive {
  @override
  final IconData iconData = Icons.repeat_one_outlined;
}

class RepeatButtonAll extends _RepeatButtonActive {
  @override
  final IconData iconData = Icons.repeat_rounded;
}
