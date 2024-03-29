import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/mine/asset_detail_model.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/model/home/now_market_model.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/home/home_icon_widget.dart';
import 'package:rok/widget/home/home_item.dart';
import 'package:rok/widget/home/home_list_widget.dart';
import 'package:rok/widget/home/home_notifications_widget.dart';
import 'package:rok/widget/home/home_profit_loss_widget.dart';
import 'package:rok/widget/home/home_quotes_item.dart';
import 'package:rok/widget/home/home_swiper_widget.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:rok/widget/common/refresh_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeData homeData;
  AssetDetailModel detailModel;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      body: Container(
        color: kAppBcgColor,
        child: homeData == null
            ? Container()
            : MyRefresh(
                onRefresh: () {
                  getHomeData();
                },
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    HomeBannerWidget(banners: homeData.banners),
                    homeData.contracts == null
                        ? Container()
                        : HomeQuotesList(contracts: homeData.contracts),
                    HomeIconWidget(menus: homeData.menus),
                    homeData.notices == null
                        ? Container()
                        : HomeNotifWidget(notices: homeData.notices),
                    HomeProfitLossWidget(detailModel: detailModel),
                    HomeListWidget()
                  ],
                ),
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);

    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
    });

    // reGetCountdown();

    getHomeData();
  }

  getAssetDetail() async {
    detailModel = await assetDetail();
    setState(() {});
  }

  getHomeData() async {
    var data = await reqHomeData();
    homeData = HomeData.fromJson(data);
    print("homeData" + homeData.contracts.length.toString());
    // getContractListData();
    getAssetDetail();
  }

  List<Contracts> contracts;

  getContractListData() async {
    contracts = await reqContractListData();
    setState(() {});
    print("contracts" + contracts.length.toString());
  }

  void _onTapHandle(color) {
    controller.reset();
    animation = ColorTween(begin: color, end: Colors.white).animate(controller);
    controller.forward();
  }

  Timer _countdownTimer;
  int _countdownNum = 7759;

  void reGetCountdown() {
    if (_countdownTimer != null || _countdownNum < 0) {
      return;
    }
    _countdownTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      _countdownNum--;
      if (_countdownNum % 3 == 1) {
        _onTapHandle(Colors.red);
      } else {
        _onTapHandle(Colors.green);
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  AnimationController controller;
  Animation animation;
}
