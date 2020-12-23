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

import 'quotes_details_widget.dart';

///行情横屏
class QuotesDetailsHPage extends StatefulWidget {
  @override
  _QuotesDetailsHPageState createState() => _QuotesDetailsHPageState();
}

class _QuotesDetailsHPageState extends State<QuotesDetailsHPage>
    with SingleTickerProviderStateMixin {
  DeviceOrientation _deviceOrientation;

  StreamSubscription<DeviceOrientation> subscription;

  @override
  void initState() {
    super.initState();

   SystemChrome.setPreferredOrientations([
     DeviceOrientation.landscapeRight,
   ]);

  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    subscription?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          QuotesDetailsWidget(height: double.infinity,),
          MySuperWidget(
            bgColor: Color(0x55ffffff),
            width: 60,
            height: 60,
            margin: EdgeInsets.only(left: 30,top: 25),
            child: Icon(Icons.close,size: 55,),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}


