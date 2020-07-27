import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/home/home_icon_widget.dart';
import 'package:rok/widget/home/home_item.dart';
import 'package:rok/widget/home/home_list_widget.dart';
import 'package:rok/widget/home/home_notifications_widget.dart';
import 'package:rok/widget/home/home_profit_loss_widget.dart';
import 'package:rok/widget/home/home_quotes_item.dart';
import 'package:rok/widget/home/home_swiper_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      body: Container(
        color: kAppBcgColor,
        child: ListView(
          children: <Widget>[
            HomeBannerWidget(),
            HomeQuotesList(color: animation.value),
            HomeIconWidget(),
            HomeNotifWidget(),
            HomeProfitLossWidget(),
            HomeListWidget()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 600),
        vsync: this); //AnimationController

    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });

    reGetCountdown();
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
