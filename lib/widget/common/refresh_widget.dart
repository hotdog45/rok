import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class YPRefresh extends StatelessWidget {
  final EasyRefreshController controller;
  final Widget child;
  final bool isHome;
  final VoidCallback onRefresh;
  final VoidCallback onLoad;

  YPRefresh(
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
//      header: ClassicalHeader(
//          refreshText: "下拉刷新",
//          refreshReadyText: "释放刷新",
//          refreshingText: "正在刷新",
//          refreshFailedText: "刷新失败",
//          refreshedText: "刷新完成",
//          showInfo: false,
//          completeDuration: Duration(milliseconds: 500)
//      ),
      footer: MaterialFooter(),
//      footer: ClassicalFooter(
//          loadReadyText: "释放加载",
//          noMoreText: "我是有底线的",
//          loadedText: "加载完成",
//          loadText: "上拉加载更多",
//          loadingText: "正在加载",
//          showInfo: false),
    );
  }
}
