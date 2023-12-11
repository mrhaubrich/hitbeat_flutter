import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/main.dart';
import 'package:hitbeat_flutter/presentation/widgets/page_route.dart';
import 'package:hitbeat_flutter/presentation/widgets/pages/page_content.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  final _controller = SidebarXController(selectedIndex: 0);

  final ValueNotifier<int> _selectedPage = ValueNotifier(0);

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

  List<SidebarXItem> get items => PageContentFactory.items
      .map(
        (e) => SidebarXItem(
          label: e.label,
          icon: e.icon,
          onTap: () {
            _controller.selectIndex(e.index);
          },
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      key: UniqueKey(),
      controller: _controller
        ..addListener(() {
          if (_selectedPage.value != _controller.selectedIndex) {
            debugPrint('Selected index: ${_controller.selectedIndex}');
            _selectedPage.value = _controller.selectedIndex;
            context
                .read<GlobalKey<NavigatorState>>()
                .currentState!
                .pushReplacement(
                  CustomNamedPageTransition(
                    PageContentFactory.getRoute(_controller.selectedIndex),
                  ),
                );
          }
        }),
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
      items: items.sublist(0, 7),
      footerItems: items.sublist(7),
    );
  }
}

final divider = Divider(
  color: white.withOpacity(0.3),
  height: .5,
);
