import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class MyRefresh extends StatelessWidget {
  final EasyRefreshController controller;
  final Widget child;
  final bool isHome;
  final VoidCallback onRefresh;
  final VoidCallback onLoad;

  MyRefresh(
      {this.controller,
      this.child,
      this.isHome = false,
      this.onRefresh,
      this.onLoad});

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: controller,
      child: child,
      onRefresh: onRefresh,
      onLoad: onLoad,
      header: MaterialHeader(),
      footer: MaterialFooter(),
    );
  }
}
