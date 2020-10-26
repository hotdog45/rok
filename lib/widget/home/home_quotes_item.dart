import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/now_market_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/common/unils/web_socket_utils.dart';
import 'package:rok/page/quotes_details_page.dart';
import 'package:rok/widget/kline/kchart/utils/date_format_util.dart';
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
  final List<Contracts> contracts;

  const HomeQuotesList({Key key,   this.contracts}) : super(key: key);


  @override
  _HomeQuotesListState createState() => _HomeQuotesListState();
}

class _HomeQuotesListState extends State<HomeQuotesList> {

  NowMarketModel nowMarketModel;

  @override
  void initState() {
    super.initState();
    if (widget.contracts != null){
      reqMarket(widget.contracts[0].topic);
    }

  }

  reqMarket(topic){
    // print("IOWebSocketChannel=============="+'{"event":"addTopic","topic":"${topic}"}');
    WebSocketUtils.channel.sink
        .add('{"event":"addTopic","topic":"${topic}"}');
    WebSocketUtils.channel.stream.listen((message) {
      // print("IOWebSocketChannel===" + message.toString());
      try{
        var model = SocketBaseModel.fromJson(jsonDecode(message));
        if (model.ch == topic) {
          nowMarketModel = NowMarketModel.fromJson(model.tick);
          // print("nowMarketModel:"+nowMarketModel.close.toString());
          setState(() {});
        }
      }catch (e){
        WebSocketUtils.channel.sink.close(message.goingAway);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.contracts == null ? Container():Container(
      color: kAppWhiteColor,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {

          return HomeQuotesItem(nowMarketModel: nowMarketModel,contract: widget.contracts[index],
          );
        },
        itemCount: widget.contracts.length,
      ),
    );
  }
}

class HomeQuotesItem extends StatelessWidget {
  final NowMarketModel nowMarketModel;


  final Contracts contract;

  const HomeQuotesItem({Key key, this.nowMarketModel, this.contract}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return nowMarketModel == null ? Container(): InkWell(
        onTap: () {
          NavigatorUtils.navigatorRouter(context, QuotesDetailsPage());
        },
        child: Container(
          width: ScreenUtil.screenWidthDp / 2.5,
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
                contract.name,
                style: TextStyle(
                    fontSize: fontSizeMiddle,
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
                      color: nowMarketModel.close - nowMarketModel.open > 0
                          ? kGreenColor
                          : kRedColor),
                ),
              ),
              Expanded(
                child: Text(
                  ((nowMarketModel.close - nowMarketModel.open) /
                              nowMarketModel.open *
                              100)
                          .toStringAsFixed(2)
                          .toString() +
                      "%",
                  style: TextStyle(
                      fontSize: fontSizeSmall,
                      color: nowMarketModel.close - nowMarketModel.open > 0
                          ? kGreenColor
                          : kRedColor),
                ),
              ),
//              Container(
//                width: 100,
//                height: 25,
//                decoration: BoxDecoration(
//                    color: kGreenColor, borderRadius: BorderRadius.circular(3)),
//                alignment: Alignment.center,
//                child: Text(
//                  "≈¥56522.222",
//                  style:
//                      TextStyle(fontSize: fontSizeSmall, color: kAppWhiteColor),
//                ),
//              ),
            ],
          ),
        ));
  }
}
