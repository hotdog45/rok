import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/operation_records_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/net/web_socket_utils.dart';
import 'package:rok/widget/common/my_tab_bar.dart';
import 'package:rok/widget/common/roundUnderlineTabIndicator.dart';
import 'package:rok/widget/quotes/quotes_item_widget.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: home_list_widget
/// Author: lishunfeng
/// Date: 2020/7/26 7:58 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class HomeListWidget extends StatefulWidget {

  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
    reqMarket();
  }

  OperationRecordsModel operationRecordsModel;

  reqMarket() {
    // print("====================================");
    WebSocketUtils.channel.sink.add('{"event":"addTopic","topic":"market.rank.list"}');
    WebSocketUtils.channel.stream.listen((message) {
      try {
        // print("11111111111111===================================="+message);

        var model = SocketBaseModel.fromJson(jsonDecode(message));
        // print("====2222222222222222222================="+model.toJson().toString());

        if (model.ch == "market.rank.list") {
          operationRecordsModel =
              OperationRecordsModel.fromJson(model.tick);
          // print("nowMarketModel:" + operationRecordsModel.toString());
          setState(() {});
        }
      } catch (e) {
        WebSocketUtils.channel.sink.close(message.goingAway);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MyTabBar(mController: mController, tabTitles: tabTitles),
          Container(
              width: double.infinity,
              height: 80.0 * 4 + 20,
              child: _tabBarView())
        ],
      ),
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
              OperationRecords model  = operationRecordsModel.last5[index];

              return QuotesItemWidget(
                color: Colors.white,
                model: model,
              );
            },
            itemCount: operationRecordsModel == null || operationRecordsModel.last5 == null ? 0:  operationRecordsModel.last5.length,
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
