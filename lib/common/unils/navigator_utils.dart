import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/page/common/main_page.dart';
import 'package:rok/page/user/login_page.dart';


//import 'package:flutter_boost/flutter_boost.dart';

/**
 * 导航栏
 */


class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    goMainPageByIndex(context, 0);
  }

  ///主页某个tab
  static goMainPageByIndex(BuildContext context, int index) {
    Navigator.pushAndRemoveUntil(
        context,
        new CupertinoPageRoute(
            builder: (context) => pageContainer(context,MainPage(index))),
        (route) => false);
  }

  ///登录页
  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }



  /// 提示框
  static showToast(msg) {
    if (Platform.isIOS) {
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    } else {
      Fluttertoast.showToast(msg: msg);
    }
  }

  //隐藏键盘
  static dismissKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  ///
  static pushAndPopPage(BuildContext context, Widget widget) {
    Navigator.pop(context);
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(context,widget)));
  }

  ///公共打开方式
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(context,widget)));
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(BuildContext context,widget) {
    return MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }

  ///弹出 dialog
  static Future<T> showDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return MediaQuery(

              ///不受系统字体缩放影响
              data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .copyWith(textScaleFactor: 1),
              child: SafeArea(child: builder(context)));
        });
  }
}
