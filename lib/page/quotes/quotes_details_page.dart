import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/my_drawer.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/my_tab_bar.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/quotes/entrust_widget.dart';
import 'package:rok/widget/quotes/instructions_widget.dart';
import 'package:rok/widget/quotes/make_a_bargain_widget.dart';

import 'quotes_details_h_page.dart';
import 'quotes_details_widget.dart';

class QuotesDetailsPage extends StatefulWidget {
  final String name;

  const QuotesDetailsPage({Key key, this.name = "ethusdt"}) : super(key: key);

  @override
  _QuotesDetailsPageState createState() => _QuotesDetailsPageState();
}

class _QuotesDetailsPageState extends State<QuotesDetailsPage>
    with SingleTickerProviderStateMixin {

  bool showDrawer = false;

  var messageData ;
  StreamSubscription<DeviceOrientation> subscription;

  @override
  void initState() {
    super.initState();

    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    subscription?.cancel();
    super.dispose();
    mController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: YPAppBar("",
              centerTitle: false,
              titleWidget: InkWell(
                onTap: () {
                  NavigatorUtils.showToast("目录");
                },
                child: MySuperWidget(
                  onTap: () {
                    showDrawer = true;
                    setState(() {});
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.list),
                      Text(
                        "OTC-USDT",
                        style: TextStyle(color: kAppTextColor, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.share),
                    onPressed: () {
                      NavigatorUtils.showToast("分享");
                    }),
                IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.fullscreen, size: 30),
                    onPressed: () {
                      NavigatorUtils.navigatorRouter(context, QuotesDetailsHPage());
                    }),
                IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.queue_play_next),
                    onPressed: () {
                      NavigatorUtils.showToast("监控");
                    }),
              ]).build(context),
          body: ListView(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.screenWidthDp * 0.5,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "9600.21↑",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text("+32.23   12.2%"),
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil.screenWidthDp * 0.5,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("24H最高"),
                              Text("9600.21"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("24H最低"),
                              Text("9600.21"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("24H"),
                              Text("9600.21"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              QuotesDetailsWidget(height: 450,name: widget.name),
              MyTabBar(mController: mController, tabTitles: tabTitles),
              Container(
                  width: double.infinity, height: 800, child: _tabBarView())
            ],
          ),
        ),
        !showDrawer
            ? Container()
            : MyDrawer(
                closeCallBack: () {
                  showDrawer = false;
                  setState(() {});
                },
              )
      ],
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.asMap().keys.map((index) {
        switch (index) {
          case 0:
            return EntrustWidget();
          case 1:
            return MakeABargainWidget();
          case 2:
            return InstructionsWidget();
          default:
            return Container();
        }
      }).toList(),
    );
  }

  TabController mController;
  List<String> tabTitles = [
    "委托", // entrust
    "成交", // knockdown
    "说明", //Instructions
  ];
}
