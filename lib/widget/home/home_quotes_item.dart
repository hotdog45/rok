import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/now_market_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/common/net/web_socket_utils.dart';
import 'package:rok/page/quotes/quotes_details_page.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/kline/kchart/utils/date_format_util.dart';
import 'package:web_socket_channel/io.dart';
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

  const HomeQuotesList({Key key, this.contracts}) : super(key: key);

  @override
  _HomeQuotesListState createState() => _HomeQuotesListState();
}

class _HomeQuotesListState extends State<HomeQuotesList> {


  @override
  Widget build(BuildContext context) {
    return widget.contracts == null
        ? Container()
        : Container(
            color: kAppWhiteColor,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                // return MySuperWidget(text: "ces "
                return  HomeQuotesItem(
                        contract: widget.contracts[index],
                      );
              },
              itemCount: widget.contracts.length,
            ),
          );
  }
}

class HomeQuotesItem extends StatefulWidget {
  final Contracts contract;

  const HomeQuotesItem({Key key, this.contract})
      : super(key: key);

  @override
  _HomeQuotesItemState createState() => _HomeQuotesItemState();
}

class _HomeQuotesItemState extends State<HomeQuotesItem> {
  NowMarketModel nowMarketModel;

  WebSocketChannel channel = IOWebSocketChannel.connect(getWebSocketAddress(2));

  @override
  void initState() {
    super.initState();
    if (widget.contract != null) {
      // reqMarket(widget.contract.topic);
    }
  }

  reqMarket(topic) {
    channel.sink.add('{"event":"addTopic","topic":"$topic"}');
    channel.stream.listen((message) {
      try {
        var model = SocketBaseModel.fromJson(jsonDecode(message));
        if (nowMarketModel ==null && model != null && model.ch == topic) {
          nowMarketModel = NowMarketModel.fromJson(model.tick);
          setState(() {});
        }
      } catch (e) {
        channel.sink.close(message.goingAway);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return nowMarketModel == null
        ? MySuperWidget(text: "ces222 ")
        : InkWell(
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
                    widget.contract.name,
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
