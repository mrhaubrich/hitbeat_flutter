import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/business_logic/player/track.dart';
import 'package:hitbeat_flutter/presentation/widgets/miolo.dart';
import 'package:hitbeat_flutter/presentation/widgets/pages/page_content.dart';
import 'package:hitbeat_flutter/presentation/widgets/player_bar/player_bar.dart';
import 'package:hitbeat_flutter/presentation/widgets/sidebar/sidebar.dart';
import 'package:hitbeat_flutter/themes.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  runApp(
    Provider<Player>(
      create: (_) {
        return Player(
          configuration: PlayerConfiguration(
            ready: () async {
              debugPrint('Player ready');
            },
          ),
        )
          ..open(
            Playlist(
              [
                Media(
                  mockTrack.path,
                ),
                Media(
                  mockTrack2.path,
                ),
              ],
            ),
          )
          ..setAudioTrack(AudioTrack.auto());
      },
      child: SidebarXExampleApp(),
    ),
  );
}

class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({super.key});

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
        theme: themeData,
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
