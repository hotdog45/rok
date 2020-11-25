import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/page/user/login_page.dart';

import 'input_amount_widget.dart';
import 'input_item_widget.dart';
import 'input_switch_widget.dart';

class ProfileCalculatorWidget extends StatefulWidget {
  @override
  _ProfileCalculatorWidgetState createState() =>
      _ProfileCalculatorWidgetState();
}

class _ProfileCalculatorWidgetState extends State<ProfileCalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [kMineBgColor1, kMineBgColor]),
        ),
        child: Column(
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
            Container(
              margin: EdgeInsets.only(top: 20),
              child: InputAmountWidget(theme: "开仓价格", unit: "USDT"),
            ),
            InputAmountWidget(theme: "平仓价格", unit: "USDT"),
            InputAmountWidget(theme: "平仓数量", unit: "手"),
            InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                  height: 46,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kAppThemeColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "开始计算",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: kAppFontSize(28)),
                  )),
              onTap: () {
                Fluttertoast.showToast(msg: "点我gan嘛");
              },
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: ScreenUtil.screenWidthDp,
              height: 300,
              child: Text(
                "注：实际交易中因存在手续费，可能导致计算结果与交易结果不完全一致。\n该价格仅供用户参考，实际还请以风险度为准 ",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: fontSizeMicro,
                  color: kAppSubTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  //收益计算
  void profitCalculation() async {


    var data   = await assetDetail() ;
    detailModel = assetDetailModel.fromJson(data);

    setState(() {

    });

    return;

  }



}
