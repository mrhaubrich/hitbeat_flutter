import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/extensions/sidebar_stack.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class Miolo extends StatefulWidget {
  const Miolo({
    super.key,
    required this.child,
    required this.sidebarXController,
  });

  final Widget? child;

  final SidebarXController sidebarXController;

  @override
  State<Miolo> createState() => _MioloState();
}

class _MioloState extends State<Miolo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: ListenableBuilder(
          listenable: widget.sidebarXController,
          builder: (context, value) {
            final navigatorKey =
                Provider.of<GlobalKey<NavigatorState>>(context);
            return navigatorKey.currentState?.canPop() ?? false
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                      widget.sidebarXController.pop();
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
      body: Center(
        child: widget.child ?? const SizedBox.shrink(),
      ),
    );
  }
}
