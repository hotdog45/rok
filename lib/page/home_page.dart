import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/home/home_item.dart';
import 'package:rok/widget/home/home_list_widget.dart';
import 'package:rok/widget/home/home_quotes_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          color: kAppBcgColor,
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=257845908,2576941774&fm=26&gp=0.jpg",
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  pagination: SwiperPagination(),
                ),
              ),
              Container(
                color: kAppWhiteColor,
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return HomeQuotesItem(color:(_countdownNum + index) %2==1 ?animation.value:Colors.white);
                  },
                  itemCount: 7,
                ),
              ),
              Container(
                height: 90,
                color: kAppWhiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    HomeItemWidget(name: "帮助中心",),
                    HomeItemWidget(name: "福利中心",),
                    HomeItemWidget(name: "在线客服",),
                  ],
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: kAppWhiteColor,
                  borderRadius: BorderRadius.circular(6)
                ),
                margin: EdgeInsets.all(10),
                child: Row(children: <Widget>[
                  Icon(Icons.scanner),
                  Expanded(
                    child: Text(
                      "跨日交易上线公告",
                      style:
                      TextStyle(fontSize: fontSize14, color: kAppTextColor),
                    ),
                  ),
                  Icon(Icons.arrow_right),

                ],),
              ),
              Container(
                height: 140,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.screenWidthDp*0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            kAppColor("#85C1E9"),
                            kAppColor("#2E86C1")
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text(
                                "浮动盈亏",
                                style:
                                TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                              ),
                              Text(
                                "0.00002",
                                style:
                                TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                              ),
                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text(
                                "浮动盈亏",
                                style:
                                TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                              ),
                              Text(
                                "0.00002",
                                style:
                                TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                              ),
                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text(
                                "浮动盈亏",
                                style:
                                TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                              ),
                              Text(
                                "0.00002",
                                style:
                                TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                              ),
                            ],),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      Container(
                        height: 54,
                        width: 130,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              kAppColor("#85C1E9"),
                              kAppColor("#2E86C1")
                            ],
                          ),
                            borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "入金",
                          style:
                          TextStyle(fontSize: fontSize18, color: kAppWhiteColor),
                        ),
                      ),
                      Container(
                        height: 54,
                        width: 130,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              kAppColor("#76448A"),
                              kAppThemeColor
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "出金",
                          style:
                          TextStyle(fontSize: fontSize18, color: kAppWhiteColor),
                        ),
                      ),
                    ],)
                  ],
                ),
              ),
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
    controller = AnimationController(
        duration: Duration(milliseconds: 600), vsync: this); //AnimationController

    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    animation2 =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });

    reGetCountdown();
  }

  void _onTapHandle(color) {
    controller.reset();
    animation =
        ColorTween(begin: color, end: Colors.white).animate(controller);
    controller.forward();
  }




  Timer _countdownTimer;
  int _countdownNum = 7759;

  void reGetCountdown() {
    if (_countdownTimer != null) {
      return;
    }
    _countdownTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      _countdownNum --;
      if (_countdownNum %3==1){
        _onTapHandle(Colors.red);
      }else{
        _onTapHandle(Colors.green);
      }

      setState(() {

      });
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
  Animation animation2;
}
