import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/operation_records_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/net/web_socket_utils.dart';
import 'package:rok/widget/common/my_tab_bar.dart';
import 'package:rok/widget/common/roundUnderlineTabIndicator.dart';
import 'package:rok/widget/quotes/quotes_item_widget.dart';
import 'package:web_socket_channel/io.dart';
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
  WebSocketChannel channel = IOWebSocketChannel.connect(getWebSocketAddress(2));

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
    channel.sink.add('{"event":"addTopic","topic":"market.rank.list"}');
    channel.stream.listen((message) {
      try {
        var model = SocketBaseModel.fromJson(jsonDecode(message));
        if (model.ch == "market.rank.list") {
          operationRecordsModel = OperationRecordsModel.fromJson(model.tick);
          setState(() {});
        }
      } catch (e) {
        channel.sink.close(message.goingAway);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyTabBar(mController: mController, tabTitles: tabTitles),
        Container(
            width: double.infinity,
            height: 85.0 * operationRecordsModel.last5.length + 20,
            child: _tabBarView())
      ],
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
        return operationRecordsModel == null
            ? Container()
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  OperationRecords model = item == "涨幅榜"
                      ? operationRecordsModel.top5[index]
                      : operationRecordsModel.last5[index];
                  return QuotesItemWidget(
                    color: Colors.white,
                    model: model,
                  );
                },
                itemExtent: 85,
                itemCount: item == "涨幅榜"
                    ? operationRecordsModel.top5.length
                    : operationRecordsModel.last5.length,
                padding: EdgeInsets.all(15),
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
