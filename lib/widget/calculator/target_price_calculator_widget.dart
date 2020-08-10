import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';

import 'input_item_widget.dart';
import 'input_switch_widget.dart';

class TargetPriceCalculatorWidget extends StatefulWidget {
  @override
  _TargetPriceCalculatorWidgetState createState() =>
      _TargetPriceCalculatorWidgetState();
}

class _TargetPriceCalculatorWidgetState
    extends State<TargetPriceCalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20),
              child: InputItemWidget(
                theme: "合约",
                type: 10,
                rightAction: "BTC/USDT 永续",
              )),
          InputSwitchWidget(
            theme: "开仓类型",
            type: 1,
          ),
          InputItemWidget(
            theme: "杠杆比例",
            type: 10,
            rightAction: "100X",
          ),
        ],
      ),
    );
  }
}
