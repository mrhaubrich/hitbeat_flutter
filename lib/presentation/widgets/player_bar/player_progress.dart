import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_state.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PlayerProgress extends StatelessWidget {
  const PlayerProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerProgressBloc(max: 230),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: BlocBuilder<PlayerProgressBloc, PlayerProgressState>(
          builder: (context, state) {
            return SfSlider(
              value: state.value,
              min: 0,
              max: state.max,
              enableTooltip: true,
              tooltipTextFormatterCallback:
                  (dynamic actualValue, String formattedText) {
                final int minutes = (actualValue / 60).truncate();
                final int seconds = (actualValue % 60).truncate();
                return '$minutes:${seconds.toString().padLeft(2, '0')}';
              },
              onChanged: (newValue) {
                context
                    .read<PlayerProgressBloc>()
                    .add(PlayerProgressChange(value: newValue, max: state.max));
              },
              onChangeEnd: (newValue) {
                context
                    .read<PlayerProgressBloc>()
                    .add(PlayerProgressFinish(value: newValue, max: state.max));
              },
            );
          },
        ),
      ),
    );
  }
}
