import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/pages/albums.dart';
import 'package:hitbeat_flutter/presentation/pages/artists.dart';
import 'package:hitbeat_flutter/presentation/pages/favorites.dart';
import 'package:hitbeat_flutter/presentation/pages/genres.dart';
import 'package:hitbeat_flutter/presentation/pages/library.dart';
import 'package:hitbeat_flutter/presentation/pages/not_found.dart';
import 'package:hitbeat_flutter/presentation/pages/playlists.dart';
import 'package:hitbeat_flutter/presentation/pages/start.dart';
import 'package:hitbeat_flutter/presentation/pages/tracks.dart';

class PageContent {
  final int index;
  final Widget content;
  final IconData icon;
  final String label;

  PageContent({
    required this.index,
    required this.content,
    required this.icon,
    required this.label,
  });
}

class PageContentFactory {
  static Set<PageContent> get items => {
        PageContent(
          index: 0,
          content: const StartPage(),
          icon: Icons.home,
          label: 'Home',
        ),
        PageContent(
          index: 1,
          content: const TracksPage(),
          icon: Icons.queue_music_rounded,
          label: 'Tracks',
        ),
        PageContent(
          index: 2,
          content: const FavoritesPage(),
          icon: Icons.favorite_rounded,
          label: 'Favorites',
        ),
        PageContent(
          index: 3,
          content: const PlaylistsPage(),
          icon: Icons.my_library_music_rounded,
          label: 'Playlists',
        ),
        PageContent(
          index: 4,
          content: const GenresPage(),
          icon: Icons.music_note_rounded,
          label: 'Genres',
        ),
        PageContent(
          index: 5,
          content: const ArtistsPage(),
          icon: Icons.people_rounded,
          label: 'Artists',
        ),
        PageContent(
          index: 6,
          content: const AlbumsPage(),
          icon: Icons.album_rounded,
          label: 'Albums',
        ),

        // footer:
        PageContent(
          label: 'Library',
          icon: Icons.library_music_rounded,
          index: 7,
          content: const LibraryPage(),
        ),
      };

  static Widget createPageContent(int index) {
    return items.firstWhere(
      (element) => element.index == index,
      orElse: () {
        return PageContent(
          index: index,
          content: const NotFoundPage(),
          icon: Icons.error,
          label: 'Not found',
        );
      },
    ).content;
  }
}
