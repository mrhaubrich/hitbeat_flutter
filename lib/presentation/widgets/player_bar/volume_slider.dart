import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/volume_slider/volume_slider_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/volume_slider/volume_slider_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/volume_slider/volume_slider_state.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VolumeSliderBloc(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<VolumeSliderBloc, VolumeSliderState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(state.volumeIcon),
                color: Colors.white60,
                onPressed: () {
                  context.read<VolumeSliderBloc>().add(
                        const VolumeMuteToggle(),
                      );
                },
              );
            },
          ),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: BlocBuilder<VolumeSliderBloc, VolumeSliderState>(
                builder: (context, state) {
                  return SfSlider(
                    value: state.isMuted ? 0 : state.volume,
                    min: 0,
                    max: 100,
                    enableTooltip: true,
                    tooltipTextFormatterCallback:
                        (dynamic actualValue, String formattedText) {
                      return '${state.volume.toInt()}%';
                    },
                    onChanged: (newValue) {
                      context.read<VolumeSliderBloc>().add(
                            VolumeSliderChange(volume: newValue),
                          );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
