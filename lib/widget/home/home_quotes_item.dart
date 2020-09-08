import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/model/home/now_market_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/quotes_details_page.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: home_quotes_item
/// Author: lishunfeng
/// Date: 2020/7/26 6:25 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class HomeQuotesList extends StatefulWidget {
  final WebSocketChannel channel;

  const HomeQuotesList({Key key, this.channel}) : super(key: key);

  @override
  _HomeQuotesListState createState() => _HomeQuotesListState();
}

class _HomeQuotesListState extends State<HomeQuotesList> {
  NowMarketModel nowMarketModel;

  @override
  void initState() {
    super.initState();
    print("IOWebSocketChannel==============");
    widget.channel.sink
        .add('{"event":"addTopic","topic":"market.bchusdt.detail"}');
    widget.channel.stream.listen((message) {
//      channel.sink.close(message.goingAway);
      print("IOWebSocketChannel===" + message.toString());
      var model = SocketBaseModel.fromJson(jsonDecode(message));
      if (model.ch == "market.bchusdt.detail") {
        nowMarketModel = NowMarketModel.fromJson(model.tick);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppWhiteColor,
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return HomeQuotesItem(nowMarketModel: nowMarketModel);
        },
        itemCount: 2,
      ),
    );
  }
}

class HomeQuotesItem extends StatelessWidget {
  final NowMarketModel nowMarketModel;

  const HomeQuotesItem({Key key, this.nowMarketModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          NavigatorUtils.navigatorRouter(context, QuotesDetailsPage());
        },
        child: Container(
          width: ScreenUtil.screenWidthDp / 3,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "BTC/USDT",
                style: TextStyle(
                    fontSize: fontSizeNormal,
                    fontWeight: FontWeight.bold,
                    color: kAppTextColor),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 6),
                child: Text(
                  nowMarketModel.close.toString(),
                  style: TextStyle(
                      fontSize: fontSizeNormal,
                      fontWeight: FontWeight.w600,
                      color: kGreenColor),
                ),
              ),
              Expanded(
                child: Text(
                  ((nowMarketModel.close - nowMarketModel.open) /nowMarketModel.open *100).toStringAsFixed(2)
                          .toString() +
                      "%",
                  style: TextStyle(fontSize: fontSizeSmall, color: kGreenColor),
                ),
              ),
              Container(
                width: 100,
                height: 25,
                decoration: BoxDecoration(
                    color: kGreenColor, borderRadius: BorderRadius.circular(3)),
                alignment: Alignment.center,
                child: Text(
                  "≈¥56522.222",
                  style:
                      TextStyle(fontSize: fontSizeSmall, color: kAppWhiteColor),
                ),
              ),
            ],
          ),
        ));
  }
}
