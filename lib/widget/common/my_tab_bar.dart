import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:rok/common/style/style.dart';

import 'roundUnderlineTabIndicator.dart';

class MyTabBar extends StatelessWidget {
  final TabController mController;
  final List<String> tabTitles;
  final bool isScrollable;

  const MyTabBar(
      {Key key, this.mController, this.tabTitles, this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppWhiteColor,
      child: TabBar(
          isScrollable: isScrollable,
          controller: mController,
          //设置tab文字得类型
          labelStyle:
              TextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.bold),
          //设置tab选中得颜色
          labelColor: Colors.black,
          //设置tab未选中得颜色
          unselectedLabelColor: Colors.black45,
          indicator: RoundUnderlineTabIndicator(
              borderSide: BorderSide(
            width: 3,
            color: kAppThemeColor,
          )),
          tabs: tabTitles.map((item) {
            return Tab(text: item);
          }).toList()),
    );
  }
}
