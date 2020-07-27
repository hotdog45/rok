import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/roundUnderlineTabIndicator.dart';
import 'package:rok/widget/quotes/quotes_item_widget.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: home_list_widget
 * Author: lishunfeng
 * Date: 2020/7/26 7:58 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class HomeListWidget extends StatefulWidget {
  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _tabBar(),
          Container(width: double.infinity, height: 80.0*4 + 20, child: _tabBarView())
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
        controller: mController,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
        }).toList());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        return Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return QuotesItemWidget(color: Colors.white);
            },
            itemCount: 4,
            padding: EdgeInsets.all(15),
          ),
        );
      }).toList(),
    );
  }

  TabController mController;
  List<String> tabTitles = [
    "涨幅榜",
    "跌幅榜",
  ];
}
