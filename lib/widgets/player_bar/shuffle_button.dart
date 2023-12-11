import 'package:flutter/material.dart';

class ShuffleButton extends StatefulWidget {
  const ShuffleButton({super.key});

  @override
  State<ShuffleButton> createState() => _ShuffleButtonState();
}

class _ShuffleButtonState extends State<ShuffleButton> {
  bool isShuffled = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shuffle_rounded),
      color: isShuffled ? Theme.of(context).primaryColor : Colors.white60,
      onPressed: () {
        setState(() {
          isShuffled = !isShuffled;
        });
      },
    );
  }
}
