import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/roundUnderlineTabIndicator.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/kline/kchart/entity/depth_entity.dart';
import 'package:rok/widget/kline/kchart/entity/k_line_entity.dart';
import 'package:rok/widget/kline/kchart/state_enum.dart';
import 'package:rok/widget/kline/kchart/utils/data_util.dart';
import 'package:rok/widget/kline/kline_data_controller.dart';
import 'package:rok/widget/kline/kline_vertical_widget.dart';
import 'package:rok/widget/kline/network/httptool.dart';
import 'dart:convert';

class QuotesDetailsPage extends StatefulWidget {
  @override
  _QuotesDetailsPageState createState() => _QuotesDetailsPageState();
}

class _QuotesDetailsPageState extends State<QuotesDetailsPage>
    with SingleTickerProviderStateMixin {
  List<KLineEntity> datas = [];
  bool showLoading = true;
  KLineDataController dataController = KLineDataController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(dataController.periodModel.period);
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      Map tick = parseJson['tick'];
      var bids = tick['bids']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      var asks = tick['asks']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
//      initDepth(bids, asks);
    });

    dataController.changePeriodClick = (KLinePeriodModel model) {
      getData(model.period);
    };

    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  void getData(String period) async {
//    String result;
//    print('获取数据失败,获取本地数据');

    setState(() {
      datas = [];
      showLoading = true;
    });
    Map<String, dynamic> results = await HttpTool.tool.get(
        'https://api.huobi.sc/market/history/kline?period=${period ?? '1day'}&size=300&symbol=ethusdt',
        null);
    List list = results["data"];
    datas = list
        .map((item) => KLineEntity.fromJson(item))
        .toList()
        .reversed
        .toList()
        .cast<KLineEntity>();
    DataUtil.calculate(datas);
    showLoading = false;
    setState(() {});

//      Map parseJson = json.decode(result);
//      List list = parseJson['data'];
//      datas = list.map((item) => KLineEntity.fromJson(item)).toList().reversed.toList().cast<KLineEntity>();
//      DataUtil.calculate(datas);
//      showLoading = false;
//      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: YPAppBar("",
          centerTitle: false,
          titleWidget: InkWell(
            onTap: () {
              NavigatorUtils.showToast("目录");
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
                  NavigatorUtils.showToast("全屏");
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
          Container(
            width: double.infinity,
            height: 450,
            child: Stack(
              children: <Widget>[
                KLineVerticalWidget(
                    datas: datas, dataController: dataController),
                Offstage(
                  offstage: !showLoading,
                  child: Container(
                      width: double.infinity,
                      height: 450,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
          _tabBar(),
          Container(width: double.infinity, height: 450, child: _tabBarView())
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
        //控制器
        controller: mController,
        //设置tab文字得类型
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.black,
        //设置tab未选中得颜色
        unselectedLabelColor: Colors.black45,
        indicator: RoundUnderlineTabIndicator(
            borderSide: BorderSide(
          width: 3,
          color: kAppThemeColor,
        )),
        tabs: tabTitles.map((item) {
          return Tab(text: item);
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        return Container(
          color: randomColor(),
          child: Center(
            child: Text(item,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        );
      }).toList(),
    );
  }

  TabController mController;
  List<String> tabTitles = [
    "委托 entrust",
    "成交 knockdown",
    "规则 rule",
  ];
}
