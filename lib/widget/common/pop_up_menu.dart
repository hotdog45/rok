import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/calculator_util_page.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: pop_up_menu
/// Author: lishunfeng
/// Date: 2020/8/3 9:35 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class MyPopupMenuBtn extends StatefulWidget {
  @override
  _MyPopupMenuBtnState createState() => _MyPopupMenuBtnState();
}

class _MyPopupMenuBtnState extends State<MyPopupMenuBtn> {
  final map = {
    "资金转入": FlutterIcons.attach_money_mdi,
    "合约指南": FlutterIcons.television_guide_mco,
    "合约计算器": FlutterIcons.calculator_ent,
    "显示设置": FlutterIcons.setting_ant,
  };

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => buildItems(),
      offset: Offset(100, 40),
      color: kAppWhiteColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onSelected: (e) {
        NavigatorUtils.showToast("点击了$e");
        switch (e) {
          case "资金转入":
            break;
          case "合约指南":
            break;
          case "合约计算器":
            NavigatorUtils.navigatorRouter(context, CalculatorUtilPage());
            break;
          case "显示设置":
            break;
          default:
            break;
        }
      },
      onCanceled: () => print('onCanceled'),
    );
  }

  List<PopupMenuItem<String>> buildItems() {
    return map.keys
        .toList()
        .map((e) => PopupMenuItem<String>(
            value: e,
            child: Wrap(
              spacing: 10,
              children: <Widget>[
                Icon(
                  map[e],
                  color: kAppTextColor,
                  size: 22,
                ),
                Text(
                  e,
                  style:
                      TextStyle(fontSize: fontSizeSmall, color: kAppTextColor),
                ),
              ],
            )))
        .toList();
  }
}
