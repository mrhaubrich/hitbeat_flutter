import 'package:flutter/material.dart';

class TracksPage extends StatelessWidget {
  const TracksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tracks',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
