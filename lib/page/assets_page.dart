import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/asset/assect_details.dart';
import 'package:rok/widget/asset/bond_and_fee_widget.dart';

import 'package:rok/widget/common/yp_app_bar.dart';

class AssetsPage extends StatefulWidget {
  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
//      appBar: YPAppBar("资产",hasBackBtn: false).build(context),
      body: Container(
        height: ScreenUtil.screenHeight,
        width: ScreenUtil.screenWidthDp,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xffCD53E1), Color(0xff421299)]),

        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.screenWidthDp - 140,
                      margin: EdgeInsets.only(top: 50, left: 20),
                      child: Text(
                        "浮动盈亏(USDT)",
                        style: TextStyle(fontSize: fontSizeMiddle, color:kAppWhiteColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 5),
                      width: ScreenUtil.screenWidthDp - 140,
                      child: Text(
                        "88888888.000000",
                        style: TextStyle(fontSize: fontSizeLager, color: kAppWhiteColor),
                      ),
                    ),
                    Container(
                      width: ScreenUtil.screenWidthDp - 140,
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        "≈0.00000000",
                        style: TextStyle(fontSize: fontSizeMiddle, color: kAppWhiteColor),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: kAppWhiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.only(top: 3,bottom: 3,left:28,right: 28),
                      margin: EdgeInsets.only(top: 41),
                      child: Text(
                        "入金",
                        style: TextStyle(fontSize: fontSizeNormal, color: kAppThemeColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "出金",
                        style: TextStyle(fontSize: fontSizeNormal, color: kAppWhiteColor),
                      ),
                    )
                  ],

                ),

              ],
            ),
            AssectDetailsWidget(),
            Stack(children: <Widget>[
              Container(

                color: kAppBcgColor,

                child: Column(children: <Widget>[

                  BondAndFeeWidget(),
                  BondAndFeeWidget(),
                  BondAndFeeWidget(),
                ],),
              )

            ],)

          ],
        ),
      ),
    );
  }
}
