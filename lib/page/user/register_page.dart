import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

import 'login_page.dart';

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
            margin: EdgeInsets.only(left: 30, top: 30),
            width: ScreenUtil.screenWidth,
            child: Text(
              "手机注册",
              style: TextStyle(color: kAppThemeColor, fontSize: fontSizeLager),
            ),
          ),
          Row(
            children: <Widget>[
              Container(

                margin: EdgeInsets.only(left: 30, top: 40),
                child: Text(
                  "+86",
                  style:
                      TextStyle(color: kAppTextColor, fontSize: fontSizeMiddle),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 5, top: 40),

                height: 20,
                width: 12,
                child: Image.asset(
                  "static/images/sanjiao.png",
                  scale: 0.5,
                ),
              ),
               Container(
                color: kAppColor("#E7E7E7"),
                width: 0.5,
                 height: 30,
                 margin: EdgeInsets.only(top: 40,left: 10),
              ),
              Container(

               margin: EdgeInsets.only(left: 5, top:35),
               width: 200,
               height: 40,
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

            margin: EdgeInsets.only(left: 20,right: 20),
          ),



          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 40),

              height: 20,
              width: 20,
              child: Image.asset(
                "static/images/yes_icon.png",
                scale: 0.5,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 5, top: 40),
              child: Text(
                "我已阅读并同意",
                style:
                TextStyle(color: kAppSub2TextColor, fontSize: fontSizeSmall),
              ),
            ),
            Container(
              margin: EdgeInsets.only( top: 40),
              child: Text(
                "《niu COIN 用户协议》",
                style:
                TextStyle(color: kAppThemeColor, fontSize: fontSizeSmall),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "和",
                style:
                TextStyle(color: kAppSub2TextColor, fontSize: fontSizeSmall),
              ),
            ),
            Container(
              margin: EdgeInsets.only( top: 40),
              child: Text(
                "《法律声明》",
                style:
                TextStyle(color: kAppThemeColor, fontSize: fontSizeSmall),
              ),
            ),
          ],),

          InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                height: 46,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:   kAppThemeColor ,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "下一步",
                  style: TextStyle(color: Colors.white, fontSize: kAppFontSize(28)),
                )),
            onTap:(){

            },
          ),

          Container(
            margin: EdgeInsets.only(top: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "已有账号？ ",
                  style: TextStyle(color: kAppSubTextColor, fontSize: 14),
                ),
                InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    child: Text(
                      "马上注册",
                      style: TextStyle(color: kAppThemeColor, fontSize: 14),
                    ),
                    onTap: () {

                      NavigatorUtils.navigatorRouter(context, LoginPage());
                    }),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
