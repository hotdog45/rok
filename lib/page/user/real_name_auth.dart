import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';

class RealNameAuth extends StatefulWidget {
  @override
  _RealNameAuthState createState() => _RealNameAuthState();
}

class _RealNameAuthState extends State<RealNameAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "身份验证",
      ).build(context),
      body:    Container(
        margin: EdgeInsets.only(top: 20),
        child: MineItemWidget(
          theme: "初级认证",
          type: 2,
          rightAction: "未认证",
          color: kAppPriceColor,
        ),
      ),
    );
  }
}
