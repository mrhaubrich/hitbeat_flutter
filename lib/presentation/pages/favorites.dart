import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Favorites',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
