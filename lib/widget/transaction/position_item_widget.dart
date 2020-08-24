import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/line_widget.dart';
import 'package:rok/widget/common/my_super_widget.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: position_item_widget
/// Author: lishunfeng
/// Date: 2020/7/30 10:22 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class PositionItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppWhiteColor,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          _getTitleWidget(),
          LineWidget(),
          Container(
            height: 175,
            child: Row(
              children: <Widget>[_getLeftWidget(), _getRightWidget()],
            ),
          ),
          MySuperWidget(
            width: 44,
            height: 24,
            hasShadow: true,
            margin: EdgeInsets.only(bottom: 10),
            bgColor: kAppWhiteColor,
            radius: 13,
            child: Icon(FlutterIcons.keyboard_arrow_up_mdi),
          )
        ],
      ),
    );
  }

  double _leftWidth = ScreenUtil.screenWidthDp * 0.5;

  _getTitleWidget() {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Image.network(
              "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=257845908,2576941774&fm=26&gp=0.jpg",
              fit: BoxFit.fill,
            ),
            height: 22,
            width: 22,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySuperWidget(
                text: "XRP",
                textColor: kAppTextColor,
                fontSize: fontSizeMiddle,
              ),
              MySuperWidget(
                text: "USDT",
                textColor: kAppSubTextColor,
                fontSize: fontSizeSmall,
              ),
            ],
          ),
          MySuperWidget(
            text: "日内卖出",
            height: 20,
            width: 60,
            margin: EdgeInsets.only(left: 15, right: 10),
            textColor: kRedColor,
            fontSize: fontSizeMin,
            bgColor: kAppWhiteColor,
            radius: 2,
            borderColor: kRedColor,
            hasBorder: true,
          ),
          MySuperWidget(
            text: "10手",
            textColor: kAppTextColor,
            fontWeight: FontWeight.bold,
            fontSize: fontSizeMiddle,
          ),
          Expanded(child: Container()),
          MySuperWidget(
            text: "-0.54",
            textColor: kRedColor,
            fontWeight: FontWeight.bold,
            fontSize: fontSizeMiddle,
          ),
          MySuperWidget(
            text: "-5.64%",
            textColor: kRedColor,
            margin: EdgeInsets.only(left: 10, right: 10),
            fontWeight: FontWeight.bold,
            fontSize: fontSizeMiddle,
          ),
        ],
      ),
    );
  }

  _getLeftWidget() {
    return Container(
      width: _leftWidth,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          _getItemWidget("杠杆", "50倍"),
          _getItemWidget("止盈", "50%(0.242335)"),
          _getItemWidget("开仓价位", "0.243490"),
          _getItemWidget("手续费", "0.2434 USDT"),
          _getItemWidget("开仓时间", "2020/07/30 22:41:34", isMicro: true),
          Container(
            height: 35,
            child: Row(
              children: <Widget>[
                _getBtn("止盈", type: 2),
                _getBtn("止损"),
              ],
            ),
          )
        ],
      ),
    );
  }

  _getRightWidget() {
    return Container(
      width: _leftWidth,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          _getItemWidget("保证金", "9.792 USDT"),
          _getItemWidget("止损", "80%(0.245238)"),
          _getItemWidget("市价平仓", "0.24509"),
          _getItemWidget("抵扣", "0"),
          _getItemWidget("清算时间", "2020/07/30 22:46:24", isMicro: true),
          Container(
            height: 35,
            child: Row(
              children: <Widget>[
                _getBtn("市价平仓", type: 2),
                _getBtn("分享"),
              ],
            ),
          )
        ],
      ),
    );
  }

  _getItemWidget(title, desc, {isMicro = false}) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style:
                    TextStyle(color: kAppSubTextColor, fontSize: fontSizeMin)),
            Text(
              desc,
              style: TextStyle(
                  color: kAppTextColor,
                  fontSize: isMicro ? fontSizeMicro : fontSizeMin),
            ),
          ],
        ));
  }

  _getBtn(title, {type = 1, callback}) {
    return Expanded(
      child: MySuperWidget(
        text: title,
        textColor: type == 1 ? kAppWhiteColor : kAppThemeColor,
        fontSize: fontSizeMin,
        bgColor: type == 1 ? kAppThemeColor : kAppWhiteColor,
        radius: 2,
        borderColor: type == 1 ? kAppWhiteColor : kAppThemeColor,
        hasBorder: true,
        margin: EdgeInsets.only(top: 10, right: type == 1 ? 0 : 10),
        onTap: callback,
      ),
    );
  }
}
