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

///行情横屏
class QuotesDetailsHPage extends StatefulWidget {
  @override
  _QuotesDetailsHPageState createState() => _QuotesDetailsHPageState();
}

class _QuotesDetailsHPageState extends State<QuotesDetailsHPage>
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

//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.landscapeRight,
//      DeviceOrientation.landscapeRight,
//    ]);

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

  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    subscription?.cancel();
    super.dispose();
  }

  void getData(String period) async {
//    String result;
//    print('获取数据失败,获取本地数据');

    setState(() {
      datas = [];
      showLoading = true;
    });
    Map<String, dynamic> results = await HttpTool.tool.get(
        'https://api.huobi.pro/market/history/kline?period=${period ?? '1day'}&size=300&symbol=btcusdt',
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            KLineVerticalWidget(datas: datas, dataController: dataController),
            Offstage(
              offstage: !showLoading,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
