import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/page/user/login_page.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_cached_network_Image.dart';

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
            InkWell(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: InputItemWidget(
                    theme: "合约",
                    type: 10,
                    rightAction: "BTC/USDT 永续",
                  )),
              onTap: (){
                popApp();
              },
            ),
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


                profitCalculation(10,"BTCUSDT",100,8,1,50);
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
  void profitCalculation(int closePrice,String contractCode,int multiple,int openPrice, int side,int quantity) async {

//int closePrice,String contractCode,int multiple,int openPrice, int side
    var data   = await profitCalculat(closePrice,contractCode,multiple,openPrice,side,quantity) ;
//    detailModel = assetDetailModel.fromJson(data);

    setState(() {

    });

    return;

  }



  List<Contracts> contracts;

  getContractListData() async {
    contracts = await reqContractListData();
    setState(() {});
    print("contracts" + contracts.length.toString());
  }


  popApp() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MySuperWidget(
                  width: 270,
                  height:378,
                  radius: 5,
                  onTap: (){



                  },
//                  child: YPCachedNetworkImage(
//                      image:imageUrl,
//                      width: 270,
//                      height: 378,
//                      isCompress:false
//
//                  ),
                ),
                MySuperWidget(
                  margin:EdgeInsets.only(top: 22),
                  child: Image.asset("static/images/icon_colse_white.png",),
                  width: ScreenUtil().setWidth(65),
                  height: ScreenUtil().setWidth(65),
                  onTap: (){
                    Navigator.of(context).pop(false);
                  },
                )
              ],
            ),
          );
        });
  }


}
