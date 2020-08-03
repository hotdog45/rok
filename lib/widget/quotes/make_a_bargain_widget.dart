import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: make_a_bargain_widget
 * Author: lishunfeng
 * Date: 2020/8/1 5:18 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class MakeABargainWidget extends StatefulWidget {
  @override
  _MakeABargainWidgetState createState() => _MakeABargainWidgetState();
}

class _MakeABargainWidgetState extends State<MakeABargainWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      color: kAppWhiteColor,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _getTitleWidget(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
          _getItem(),
        ],
      ),
    );
  }

  _getItem() {
    return Container(
      height: 27,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MySuperWidget(
              text: "17:22:08",
              textColor: kAppTextColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "卖出↓",
              textColor: kRedColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "0.23537",
              textColor: kAppTextColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "100",
              textColor: kAppTextColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSizeMin),
        ],
      ),
    );
  }

  _getTitleWidget() {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MySuperWidget(
              text: "时间",
              padding: EdgeInsets.only(right: 30),
              textColor: kAppSubTextColor,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "方向",
              padding: EdgeInsets.only(right: 20),
              textColor: kAppSubTextColor,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "价格", textColor: kAppSubTextColor, fontSize: fontSizeMin),
          MySuperWidget(
              text: "数量(手)",
              textColor: kAppSubTextColor,
              fontSize: fontSizeMin),
        ],
      ),
    );
  }
}
