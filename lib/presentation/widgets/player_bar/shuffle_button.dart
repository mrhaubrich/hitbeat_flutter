import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/shuffle_button/shuffle_button_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/shuffle_button/shuffle_button_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/shuffle_button/shuffle_button_state.dart';

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShuffleButtonBloc(),
      child: BlocBuilder<ShuffleButtonBloc, ShuffleButtonState>(
        builder: (context, state) {
          return IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            color: state.getColor(context),
            onPressed: () {
              context.read<ShuffleButtonBloc>().add(ShuffleButtonToggle());
            },
          );
        },
      ),
    );
  }
}
