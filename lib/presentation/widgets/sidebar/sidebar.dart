import 'package:flutter/material.dart' hide Stack;
import 'package:hitbeat_flutter/extensions/sidebar_stack.dart';
import 'package:hitbeat_flutter/main.dart';
import 'package:hitbeat_flutter/presentation/widgets/page_route.dart';
import 'package:hitbeat_flutter/presentation/widgets/pages/page_content.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  static SidebarXTheme get theme => SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        hoverColor: Colors.white.withOpacity(0.1),
      );

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
      theme: theme,
      extendedTheme: theme.copyWith(width: 300),
      footerDivider: divider,
      footerFitType: FooterFitType.fit,
      headerBuilder: (context, extended) {
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
      },
      items: items(context).sublist(0, 7),
      footerItems: items(context).sublist(7),
    );
  }
}

final divider = Divider(
  color: white.withOpacity(0.3),
  height: .5,
);
