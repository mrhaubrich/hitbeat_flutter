import 'package:flutter/material.dart';

class RepeatButton extends StatefulWidget {
  const RepeatButton({super.key});

  @override
  State<RepeatButton> createState() => _RepeatButtonState();
}

class _RepeatButtonState extends State<RepeatButton> {
  RepeatMode repeatMode = RepeatMode.none;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: repeatMode == RepeatMode.none
          ? const Icon(Icons.repeat_rounded)
          : repeatMode == RepeatMode.one
              ? const Icon(Icons.repeat_one_rounded)
              : const Icon(Icons.repeat_rounded),
      color: repeatMode == RepeatMode.none
          ? Colors.white60
          : Theme.of(context).primaryColor,
      onPressed: () {
        setState(() {
          repeatMode = repeatMode == RepeatMode.none
              ? RepeatMode.all
              : repeatMode == RepeatMode.all
                  ? RepeatMode.one
                  : RepeatMode.none;
        });
      },
    );
  }
}

enum RepeatMode {
  none,
  one,
  all,
}
