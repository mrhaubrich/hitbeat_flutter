import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PlayerProgress extends StatefulWidget {
  const PlayerProgress({super.key});

  @override
  State<PlayerProgress> createState() => _PlayerProgressState();
}

class _PlayerProgressState extends State<PlayerProgress> {
  double value = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: SfSlider(
        value: value,
        min: 0,
        max: 100,
        enableTooltip: true,
        tooltipTextFormatterCallback:
            (dynamic actualValue, String formattedText) {
          // the value is in seconds, so we need to convert it to minutes and seconds
          final int minutes = (actualValue / 60).truncate();
          final int seconds = (actualValue % 60).truncate();
          return '$minutes:${seconds.toString().padLeft(2, '0')}';
        },
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        },
        onChangeEnd: (newValue) {
          debugPrint('end');
        },
      ),
    );
  }
}
