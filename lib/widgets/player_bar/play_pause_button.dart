import 'package:flutter/material.dart';

class PlayPayseButton extends StatefulWidget {
  const PlayPayseButton({super.key});

  @override
  State<PlayPayseButton> createState() => _PlayPayseButtonState();
}

class _PlayPayseButtonState extends State<PlayPayseButton>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;

  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPlaying = !isPlaying;
          isPlaying
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      iconSize: 32,
      icon: AnimatedIcon(
        progress: animation,
        icon: AnimatedIcons.play_pause,
      ),
    );
  }
}
