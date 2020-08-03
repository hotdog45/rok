import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController registerController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "手机注册",
      ).build(context),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,top: 30),
            width: ScreenUtil.screenWidth,
            child: Text(
              "手机注册",
              style: TextStyle(color: kAppThemeColor, fontSize: fontSizeLager),
            ),
          ),
          Stack(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(left: 10,top: 30),
              width: 30,
              child: Text(
                "+86",
                style: TextStyle(color: kAppTextColor, fontSize: fontSizeMiddle),
              ),
            ),

    Positioned(


     child: Container(
       color: kAppColor("#E7E7E7"),
       width: 0.5,
      ),)

            ,

            Positioned(
   
              child: TextField(
                controller: registerController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  hintText: '请输入手机号',
                  hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (v) {
                  //   _setBtnState();
                },
                style: TextStyle(fontSize: 15, color: kAppTextColor),
                textAlign: TextAlign.left,
              ),
            ),
          ],
          ),
          Container(
            color: kAppColor("#E7E7E7"),
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
