import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to HitBeat!',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
