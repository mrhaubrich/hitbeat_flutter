import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/player_progress/player_progress_state.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PlayerProgress extends StatelessWidget {
  const PlayerProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerProgressBloc(
        max: 230,
        player: Provider.of<Player>(context, listen: false),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: BlocBuilder<PlayerProgressBloc, PlayerProgressState>(
          builder: (context, state) {
            return StreamBuilder(
              stream: Provider.of<Player>(context).stream.duration,
              builder: (context, durationSnapshot) {
                return Row(
                  children: [
                    Text(
                      _formatPosition(state.value),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: SfSlider(
                        value: state.value,
                        min: 0,
                        max: durationSnapshot.hasData &&
                                durationSnapshot.data!.inSeconds > 0
                            ? durationSnapshot.data!.inSeconds.toDouble()
                            : 100,
                        enableTooltip: true,
                        tooltipTextFormatterCallback:
                            (dynamic actualValue, String formattedText) {
                          return _formatPosition(actualValue);
                        },
                        onChanged: (newValue) {
                          context.read<PlayerProgressBloc>().add(
                                PlayerProgressChange(
                                  value: newValue,
                                  max: state.max,
                                  isDragging: true,
                                ),
                              );
                        },
                        onChangeEnd: (newValue) {
                          context.read<PlayerProgressBloc>().add(
                                PlayerProgressFinish(
                                  value: newValue,
                                  max: state.max,
                                ),
                              );
                        },
                      ),
                    ),
                    Text(
                      durationSnapshot.hasData
                          ? '${durationSnapshot.data!.inMinutes}:${(durationSnapshot.data!.inSeconds % 60).toString().padLeft(2, '0')}'
                          : '0:00',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  String _formatPosition(double value) {
    final int minutes = (value / 60).truncate();
    final int seconds = (value % 60).truncate();
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
