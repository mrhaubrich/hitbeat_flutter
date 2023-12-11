import 'package:flutter/material.dart';
import 'package:hitbeat_flutter/presentation/widgets/pages/page_content.dart';
import 'package:sidebarx/sidebarx.dart';

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
