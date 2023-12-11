import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/widgets/miolo.dart';
import 'package:hitbeat_flutter/presentation/widgets/pages/page_content.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/player_bar.dart';
import 'package:hitbeat_flutter/presentation/widgets/sidebar/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(SidebarXExampleApp());
}

class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey _materialAppKey = GlobalKey();

  final _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalKey<NavigatorState>>.value(value: _navigatorKey),
        Provider<GlobalKey>.value(value: _materialAppKey),
      ],
      child: MaterialApp(
        key: _materialAppKey,
        debugShowCheckedModeBanner: false,
        routes: PageContentFactory.createNamedRoutes(),
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          primaryColor: primaryColor,
          canvasColor: canvasColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
              color: Colors.white,
              fontSize: 46,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        builder: (context, child) {
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Sidebar(
                          controller: _controller,
                        ),
                        Expanded(
                          child: Miolo(
                            sidebarXController: _controller,
                            child: child,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PlayerBar(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
