import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:orientation/orientation.dart';
import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/web_socket_utils.dart';
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
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class QuotesDetailsWidget extends StatefulWidget {
  final double height;

  const QuotesDetailsWidget({Key key, this.height}) : super(key: key);
  @override
  _QuotesDetailsWidgetState createState() => _QuotesDetailsWidgetState();
}

class _QuotesDetailsWidgetState extends State<QuotesDetailsWidget> {
  List<KLineEntity> datas = [];
  bool showLoading = true;
  KLineDataController dataController = KLineDataController();
  var messageData ;
  WebSocketChannel channel = IOWebSocketChannel.connect(getWebSocketAddress(2));

  @override
  void initState() {
    super.initState();

    dataController.changePeriodClick = (KLinePeriodModel model) {
      channel.sink.close(messageData.goingAway);
      getData(model.period);
    };
    channel.stream.listen((message) {
      messageData = message;
      var model = SocketBaseModel.fromJson(jsonDecode(message));
      print("111111111111");
      if (model != null && model.ch !=null && model.ch.startsWith("market.ethusdt.kline")) {
        if (model.tick is Map){
          print("333333333333333333");
          var data = KLineEntity.fromJson(model.tick);
          datas.add(data);
        } else {
          var list = jsonDecode(model.tick);
          print("222222222");
          datas = list
              .map((item) => KLineEntity.fromJson(item))
              .toList()
              .reversed
              .toList()
              .cast<KLineEntity>();
          channel.sink.close(message.goingAway);
        }
        DataUtil.calculate(datas);
        showLoading = false;
        setState(() {});
      }
    });
    getData("1min");
  }

  void getData(String period) async {
    channel.sink.add(
        '{"event":"request","topic":"market.request","body":{ "type":1, "content":{ "ch":"market.ethusdt.kline.${period ?? "1min"}"}}} ');
    if (period.startsWith("1min")){
      channel.sink.add(
          '{"event":"addTopic","topic":"market.ethusdt.kline.${period ?? "1min"}"} ');
    }
  }

  @override
  void dispose() {
    super.dispose();
    channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return  Container(
      width: double.infinity,
      height: widget.height,
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
    );
  }

}
