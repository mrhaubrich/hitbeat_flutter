import 'package:flutter/material.dart';

class GenresPage extends StatelessWidget {
  const GenresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Genres',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
