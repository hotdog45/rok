import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/operation_records_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/refresh_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/home/home_list_widget.dart';
import 'package:rok/widget/quotes/quotes_item_widget.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class QuotesListPage extends StatefulWidget {
  @override
  _QuotesListPageState createState() => _QuotesListPageState();
}

class _QuotesListPageState extends State<QuotesListPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;
  OperationRecordsModel operationRecordsModel;

  List<Contracts> contracts = [];
  WebSocketChannel channel = IOWebSocketChannel.connect(getWebSocketAddress(2));

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 600),
        vsync: this); //AnimationController

    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    animation2 =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
//      print(animation.value);
    });
    reqMarket();
  }

  reqMarket() {
    // print("====================================");
    channel.sink.add('{"event":"addTopic","topic":"market.rank.list"}');
    channel.stream.listen((message) {
      try {
        // print("11111111111111===================================="+message);

        var model = SocketBaseModel.fromJson(jsonDecode(message));
        // print("====2222222222222222222================="+model.toJson().toString());

        if (model.ch == "market.rank.list") {
          operationRecordsModel = OperationRecordsModel.fromJson(model.tick);
          // print("nowMarketModel:" + operationRecordsModel.toString());
          setState(() {});
        }
      } catch (e) {
        //  channel.sink.close(message.goingAway);
      }
    });
  }

  void _onTapHandle() {
    controller.reset();
    animation =
        ColorTween(begin: Colors.green, end: Colors.white).animate(controller);
    controller.forward();
  }

  void _onTapHandle2() {
    controller.reset();
    animation2 =
        ColorTween(begin: Colors.red, end: Colors.white).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: YPAppBar("title.quotes", hasBackBtn: false).build(context),
      body: Container(
          child: MyRefresh(
        onRefresh: () {
          reqMarket();
        },
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            OperationRecords model = operationRecordsModel.last5[index];
            return QuotesItemWidget(
              color: animation2.value,
              model: model,
            );
          },
          itemCount: operationRecordsModel == null ||
                  operationRecordsModel.last5 == null
              ? 0
              : operationRecordsModel.last5.length,
          padding: EdgeInsets.all(15),
        ),
      )),
    );
  }
}
