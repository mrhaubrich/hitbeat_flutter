import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/player_buttons.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/player_progress.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/volume_slider.dart';
import 'package:marquee/marquee.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const ColorFilter greyscale = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);

    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      leading: ColorFiltered(
        colorFilter: greyscale,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/hitbeat-icon.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
      title: SongTitle(),
      subtitle: ArtistName(),
    );
  }
}

class SongTitle extends StatelessWidget {
  const SongTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const style = TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          );
          const text = 'Song Title Very Long Song Title Extra Long Song Title';

          return ShouldScrollText(
            text: text,
            style: style,
            maxWidth: constraints.maxWidth,
          );
        },
      ),
    );
  }
}

class ArtistName extends StatelessWidget {
  const ArtistName({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const text =
              'Artist Name Very Long Artist Name Extra Long Artist Name';
          const style = TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          );

          return ShouldScrollText(
            text: text,
            style: style,
            maxWidth: constraints.maxWidth,
          );
        },
      ),
    );
  }
}

class ShouldScrollText extends StatelessWidget {
  const ShouldScrollText({
    super.key,
    required this.text,
    required this.style,
    required this.maxWidth,
  });

  final String text;
  final TextStyle style;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    if (!shouldScrollText(text, style, maxWidth)) {
      return Text(
        text,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return Marquee(
      text: text,
      style: style,
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 50,
      velocity: 10,
    );
  }

  bool shouldScrollText(String text, TextStyle style, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      ellipsis: '...',
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }
}

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(flex: 2, child: PlayerButtons()),
        Flexible(child: PlayerProgress()),
      ],
    );
  }
}

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: const Color.fromARGB(255, 34, 35, 51),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: SongInfo(),
          ),
          Expanded(
            flex: 6,
            child: PlayerControls(),
          ),
          Expanded(
            flex: 2,
            child: VolumeSlider(),
          ),
        ],
      ),
    );
  }
}
