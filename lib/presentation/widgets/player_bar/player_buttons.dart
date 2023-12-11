import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/play_pause_button.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/repeat_button.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/shuffle_button.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        hoverColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.stop_rounded),
            onPressed: () {},
          ),
          const ShuffleButton(),
          IconButton(
            icon: const Icon(Icons.skip_previous),
            onPressed: () {},
          ),
          const PlayPayseButton(),
          IconButton(
            icon: const Icon(Icons.skip_next),
            onPressed: () {},
          ),
          const RepeatButton(),
        ],
      ),
    );
  }
}
