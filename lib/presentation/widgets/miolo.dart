import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/extensions/sidebar_stack.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class Miolo extends StatelessWidget {
  const Miolo({
    super.key,
    required this.child,
    required this.sidebarXController,
  });

  final Widget? child;

  final SidebarXController sidebarXController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: ListenableBuilder(
          listenable: sidebarXController,
          builder: (context, value) {
            final navigatorKey =
                Provider.of<GlobalKey<NavigatorState>>(context);
            return navigatorKey.currentState?.canPop() ?? false
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                      sidebarXController.pop();
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
      body: Center(
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
