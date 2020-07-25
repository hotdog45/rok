import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';

class AssectDetailsWidget extends StatefulWidget {
  @override
  _AssectDetailsWidgetState createState() => _AssectDetailsWidgetState();
}

class _AssectDetailsWidgetState extends State<AssectDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: (ScreenUtil.screenWidthDp - 90) / 2,
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      "总权益(USDT)",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 90) / 2,
                    child: Text(
                      "88888888.000000",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 90) / 2,
                    child: Text(
                      "≈0.00000000",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: (ScreenUtil.screenWidthDp - 90) / 2,
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      "可用余额(USDT)",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 90) / 2,
                    child: Text(
                      "88888888.000000",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                  Container(
                    width: (ScreenUtil.screenWidthDp - 90) / 2,
                    margin: EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      "≈0.00000000",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                        color: Colors.red,
                        margin: EdgeInsets.only(top: 25),
                        width: (ScreenUtil.screenWidthDp - 80) / 4,
                        height: (ScreenUtil.screenWidthDp - 80) / 8,
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "static/images/tab_shop_cart_sel.png",
                          height: ScreenUtil().setWidth(44),
                          width: ScreenUtil().setWidth(44),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 80) / 4,
                    child: Text(
                      "优惠券（10）",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                        color: Colors.red,
                        margin: EdgeInsets.only(top: 25),
                        width: (ScreenUtil.screenWidthDp - 80) / 4,
                        height: (ScreenUtil.screenWidthDp - 80) / 8,
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "static/images/tab_shop_cart_sel.png",
                          height: ScreenUtil().setWidth(44),
                          width: ScreenUtil().setWidth(44),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 80) / 4,
                    child: Text(
                      "提币地址",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                        color: Colors.red,
                        margin: EdgeInsets.only(top: 25),
                        width: (ScreenUtil.screenWidthDp - 80) / 4,
                        height: (ScreenUtil.screenWidthDp - 80) / 8,
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "static/images/tab_shop_cart_sel.png",
                          height: ScreenUtil().setWidth(44),
                          width: ScreenUtil().setWidth(44),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 80) / 4,
                    child: Text(
                      "出入金记录",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                        color: Colors.red,
                        margin: EdgeInsets.only(top: 25),
                        width: (ScreenUtil.screenWidthDp - 80) / 4,
                        height: (ScreenUtil.screenWidthDp - 80) / 8,
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "static/images/tab_shop_cart_sel.png",
                          height: ScreenUtil().setWidth(44),
                          width: ScreenUtil().setWidth(44),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: (ScreenUtil.screenWidthDp - 80) / 4,
                    child: Text(
                      "资金明细",
                      style:
                          TextStyle(fontSize: fontSize12, color: kAppTextColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            width: ScreenUtil.screenWidthDp,
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "资产明细",
              style: TextStyle(fontSize: fontSize18, color: kAppTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
