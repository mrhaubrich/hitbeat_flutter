import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({super.key});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  int volume = 50;
  bool isMuted = false;

  Widget get volumeIcon {
    if (volume == 0 || isMuted) {
      return const Icon(Icons.volume_off_rounded);
    } else if (volume < 50) {
      return const Icon(Icons.volume_down_rounded);
    } else {
      return const Icon(Icons.volume_up_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: volumeIcon,
          color: Colors.white60,
          onPressed: () {
            setState(() {
              isMuted = !isMuted;
            });
          },
        ),
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: SfSlider(
              value: isMuted ? 0 : volume.toDouble(),
              min: 0,
              max: 100,
              enableTooltip: true,
              tooltipTextFormatterCallback:
                  (dynamic actualValue, String formattedText) {
                return '$volume%';
              },
              onChanged: (newValue) {
                setState(() {
                  volume = newValue.toInt();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
