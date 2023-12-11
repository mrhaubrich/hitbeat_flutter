import 'package:flutter/material.dart' hide Stack;
import 'package:hitbeat_flutter/extensions/sidebar_stack.dart';
import 'package:hitbeat_flutter/presentation/widgets/page_route.dart';
import 'package:hitbeat_flutter/presentation/widgets/pages/page_content.dart';
import 'package:hitbeat_flutter/themes.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  List<SidebarXItem> items(BuildContext context) => PageContentFactory.items
      .map(
        (e) => SidebarXItem(
          label: e.label,
          icon: e.icon,
          onTap: () {
            controller.push(e.index);
            context.read<GlobalKey<NavigatorState>>().currentState!.push(
                  CustomNamedPageTransition(
                    PageContentFactory.getRoute(controller.selectedIndex),
                  ),
                );
          },
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      key: UniqueKey(),
      controller: controller,
      theme: SidebarXThemeConfig.getTheme(),
      extendedTheme: SidebarXThemeConfig.getTheme().copyWith(width: 300),
      footerDivider: Divider(
        color: white.withOpacity(0.3),
        height: .5,
      ),
      footerFitType: FooterFitType.fit,
      headerBuilder: (context, extended) {
        return _SidebarHeader(
          extended: extended,
        );
      },
      items: PageContentFactory.items
          .map((e) => _SidebarXItemConfig.getItem(e, controller, context))
          .toList()
          .sublist(0, 7),
      footerItems: PageContentFactory.items
          .map((e) => _SidebarXItemConfig.getItem(e, controller, context))
          .toList()
          .sublist(7),
    );
  }
}

class _SidebarXItemConfig {
  static SidebarXItem getItem(
      PageContent e, SidebarXController controller, BuildContext context) {
    return SidebarXItem(
      label: e.label,
      icon: e.icon,
      onTap: () {
        controller.push(e.index);
        context.read<GlobalKey<NavigatorState>>().currentState!.push(
              CustomNamedPageTransition(
                PageContentFactory.getRoute(controller.selectedIndex),
              ),
            );
      },
    );
  }
}

class _SidebarHeader extends StatelessWidget {
  final bool extended;

  const _SidebarHeader({required this.extended});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Image.asset(
                'assets/hitbeat-icon.png',
                fit: BoxFit.contain,
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                margin: EdgeInsets.only(
                  left: extended ? 10 : 0,
                ),
                constraints: BoxConstraints(
                  maxWidth: extended ? 200 : 0,
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeInOut,
                  opacity: extended ? 1 : 0,
                  child: const Text(
                    'HitBeat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
