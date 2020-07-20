
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:launch_review/launch_review.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

import 'common/webview_page.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: YPAppBar("测试列表").build(context),
      body: Container(
          child:
          ListView(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 50, top: 20, right: 50),
                  height: 46,
                  width: double.infinity,
                  child: FlatButton(
                    color: getRandomColor(),
                    child: Text("webView测试"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: ()  {
                      NavigatorUtils.navigatorRouter(context, WebViewPage(url: "https://www.baidu.com"));
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(left: 50, top: 20, right: 50),
                  height: 46,
                  width: double.infinity,
                  child: FlatButton(
                    color: getRandomColor(),
                    child: Text("行情详情"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {

                    },
                  )),
              Container(
                  margin: EdgeInsets.only(left: 50, top: 20, right: 50),
                  height: 46,
                  width: double.infinity,
                  child: FlatButton(
                    color: getRandomColor(),
                    child: Text("配置环境"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
//                      NavigatorUtils.navigatorRouter(context, ConfigPage());
                    },
                  )),

            ],
          )
      ),
    );
  }

  getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
}
