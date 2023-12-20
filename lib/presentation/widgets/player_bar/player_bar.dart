import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/player_buttons.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/player_progress.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/volume_slider.dart';
import 'package:marquee/marquee.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    super.key,
    this.track,
  });

  final Track? track;

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

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      leading: const ColorFiltered(
        colorFilter: greyscale,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/hitbeat-icon.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
      title: SongTitle(title: track?.audio.title ?? 'No song playing'),
      subtitle: const ArtistName(),
    );
  }
}

class SongTitle extends StatelessWidget {
  const SongTitle({
    super.key,
    required this.title,
  });

  final String title;

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

          return ShouldScrollText(
            text: title,
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
  const PlayerControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(flex: 2, child: PlayerButtons()),
        Flexible(
          child: PlayerProgress(),
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: StreamBuilder(
              stream: Provider.of<Player>(context).stream.track,
              builder: (context, trackSnapshot) {
                return SongInfo(track: trackSnapshot.data);
              },
            ),
          ),
          const Expanded(
            flex: 6,
            child: PlayerControls(),
          ),
          const Expanded(
            flex: 2,
            child: VolumeSlider(),
          ),
        ],
      ),
    );
  }
}
