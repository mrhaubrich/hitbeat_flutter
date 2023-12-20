import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/play_pause/play_pause_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/play_pause/play_pause_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/play_pause/play_pause_state.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayPauseButtonBloc(),
      child: BlocBuilder<PlayPauseButtonBloc, PlayPauseButtonState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () async {
              final player = Provider.of<Player>(context, listen: false);

              await player.playOrPause();

              if (context.mounted) {
                context
                    .read<PlayPauseButtonBloc>()
                    .add(PlayPauseButtonToggle());
              }
            },
            iconSize: 32,
            icon: StreamBuilder(
              stream: Provider.of<Player>(context).stream.playing,
              builder: (context, snapshot) {
                return _AnimatedPlayPauseIcon(
                  isPlaying: snapshot.data == true,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _AnimatedPlayPauseIcon extends StatefulWidget {
  final bool isPlaying;

  const _AnimatedPlayPauseIcon({
    required this.isPlaying,
  });

  @override
  State<_AnimatedPlayPauseIcon> createState() => _AnimatedPlayPauseIconState();
}

class _AnimatedPlayPauseIconState extends State<_AnimatedPlayPauseIcon>
    with SingleTickerProviderStateMixin {
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
    if (widget.isPlaying) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant _AnimatedPlayPauseIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      progress: animation,
      icon: AnimatedIcons.play_pause,
    );
  }
}
