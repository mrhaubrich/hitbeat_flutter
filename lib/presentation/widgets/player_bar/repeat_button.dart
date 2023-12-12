import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_bloc.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_event.dart';
import 'package:hitbeat_flutter/business_logic/blocs/repeat_button/repeat_button_state.dart';

class RepeatButton extends StatelessWidget {
  const RepeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepeatButtonBloc(),
      child: BlocBuilder<RepeatButtonBloc, RepeatButtonState>(
        builder: (context, state) {
          return IconButton(
            icon: Icon(state.iconData),
            color: state.getColor(context),
            onPressed: () {
              context.read<RepeatButtonBloc>().add(RepeatButtonToggle());
            },
          );
        },
      ),
    );
  }
}
