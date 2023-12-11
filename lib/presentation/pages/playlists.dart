import 'package:flutter/material.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Playlists',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
