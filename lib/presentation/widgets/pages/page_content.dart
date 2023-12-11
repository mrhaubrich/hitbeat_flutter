import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/pages/albums.dart';
import 'package:hitbeat_flutter/presentation/pages/artists.dart';
import 'package:hitbeat_flutter/presentation/pages/favorites.dart';
import 'package:hitbeat_flutter/presentation/pages/genres.dart';
import 'package:hitbeat_flutter/presentation/pages/library.dart';
import 'package:hitbeat_flutter/presentation/pages/playlists.dart';
import 'package:hitbeat_flutter/presentation/pages/start.dart';
import 'package:hitbeat_flutter/presentation/pages/tracks.dart';

class PageContent {
  final int index;
  final Widget content;
  final IconData icon;
  final String label;
  final String route;

  PageContent({
    required this.index,
    required this.content,
    required this.icon,
    required this.label,
    required this.route,
  });
}

class PageContentFactory {
  static Set<PageContent> get items => {
        PageContent(
          index: 0,
          content: const StartPage(),
          icon: Icons.home,
          label: 'Home',
          route: '/',
        ),
        PageContent(
          index: 1,
          content: const TracksPage(),
          icon: Icons.queue_music_rounded,
          label: 'Tracks',
          route: '/tracks',
        ),
        PageContent(
          index: 2,
          content: const FavoritesPage(),
          icon: Icons.favorite_rounded,
          label: 'Favorites',
          route: '/favorites',
        ),
        PageContent(
          index: 3,
          content: const PlaylistsPage(),
          icon: Icons.my_library_music_rounded,
          label: 'Playlists',
          route: '/playlists',
        ),
        PageContent(
          index: 4,
          content: const GenresPage(),
          icon: Icons.music_note_rounded,
          label: 'Genres',
          route: '/genres',
        ),
        PageContent(
          index: 5,
          content: const ArtistsPage(),
          icon: Icons.people_rounded,
          label: 'Artists',
          route: '/artists',
        ),
        PageContent(
          index: 6,
          content: const AlbumsPage(),
          icon: Icons.album_rounded,
          label: 'Albums',
          route: '/albums',
        ),

        // footer:
        PageContent(
          label: 'Library',
          icon: Icons.library_music_rounded,
          index: 7,
          content: const LibraryPage(),
          route: '/library',
        ),
      };

  static Map<String, Widget Function(BuildContext)> createNamedRoutes() {
    return items.fold<Map<String, Widget Function(BuildContext)>>(
      {},
      (previousValue, element) {
        previousValue[element.route] = (context) => element.content;
        return previousValue;
      },
    );
  }

  static String getRoute(int index) {
    final sim = items
        .firstWhere(
          (element) => element.index == index,
          orElse: () => items.first,
        )
        .route;

    debugPrint('Route: $sim');
    return sim;
  }
}
