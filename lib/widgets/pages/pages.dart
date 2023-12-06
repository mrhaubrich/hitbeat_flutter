import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/widgets/pages/page_content.dart';
import 'package:sidebarx/sidebarx.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Search', style: Theme.of(context).textTheme.headlineSmall);
  }
}

class PeopleContent extends StatelessWidget {
  const PeopleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('People', style: Theme.of(context).textTheme.headlineSmall);
  }
}

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Favorites', style: Theme.of(context).textTheme.headlineSmall);
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Profile', style: Theme.of(context).textTheme.headlineSmall);
  }
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Settings', style: Theme.of(context).textTheme.headlineSmall);
  }
}

class NotFoundContent extends StatelessWidget {
  const NotFoundContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Not found page',
        style: Theme.of(context).textTheme.headlineSmall);
  }
}

class Miolo extends StatelessWidget {
  const Miolo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final currentPageContent =
            PageContentFactory.createPageContent(controller.selectedIndex);
        return currentPageContent;
      },
    );
  }
}
