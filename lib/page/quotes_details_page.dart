import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:orientation/orientation.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/my_drawer.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/my_tab_bar.dart';
import 'package:rok/widget/common/roundUnderlineTabIndicator.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/kline/kchart/entity/depth_entity.dart';
import 'package:rok/widget/kline/kchart/entity/k_line_entity.dart';
import 'package:rok/widget/kline/kchart/state_enum.dart';
import 'package:rok/widget/kline/kchart/utils/data_util.dart';
import 'package:rok/widget/kline/kline_data_controller.dart';
import 'package:rok/widget/kline/kline_vertical_widget.dart';
import 'package:rok/widget/kline/network/httptool.dart';
import 'package:rok/widget/quotes/entrust_widget.dart';
import 'package:rok/widget/quotes/instructions_widget.dart';
import 'package:rok/widget/quotes/make_a_bargain_widget.dart';
import 'dart:convert';

import 'package:rok/widget/transaction/transaction_widget.dart';

class QuotesDetailsPage extends StatefulWidget {
  @override
  _QuotesDetailsPageState createState() => _QuotesDetailsPageState();
}

class _QuotesDetailsPageState extends State<QuotesDetailsPage>
    with SingleTickerProviderStateMixin {
  List<KLineEntity> datas = [];
  bool showLoading = true;
  bool showDrawer = false;
  KLineDataController dataController = KLineDataController();

  DeviceOrientation _deviceOrientation;

  StreamSubscription<DeviceOrientation> subscription;

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

    subscription = OrientationPlugin.onOrientationChange.listen((value) {
      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;

      setState(() {
        _deviceOrientation = value;
      });

      OrientationPlugin.forceOrientation(value);
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
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
        'https://api.huobi.com/market/history/kline?period=${period ?? '1day'}&size=300&symbol=ethusdt',
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
//                      NavigatorUtils.showToast("全屏");
                      OrientationPlugin.forceOrientation(DeviceOrientation.landscapeLeft);
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
              MyTabBar(mController: mController, tabTitles: tabTitles),
              Container(
                  width: double.infinity, height: 800, child: _tabBarView())
            ],
          ),
        ),
        !showDrawer ? Container() : MyDrawer(closeCallBack: (){
          showDrawer=false;
          setState(() {

          });
        },)
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
    "委托 entrust",
    "成交 knockdown",
    "说明 Instructions",
  ];
}
