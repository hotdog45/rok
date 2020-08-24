import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: instructions_widget
/// Author: lishunfeng
/// Date: 2020/8/1 5:27 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class InstructionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      color: kAppWhiteColor,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _getTitleWidget("合约", "BTC/USDT", true),
          _getTitleWidget("合约类型", "日内合约交易", false),
          _getTitleWidget("结算币种", "USDT", true),
          _getTitleWidget("交易时间", "08:00-次日07:55", false),
          _getTitleWidget("结算时间", "每天07:55", true),
          _getTitleWidget("跨日交易时间", "7*24小时", false),
          _getTitleWidget("行情报价", "OTC对USDT的价格", true),
          _getTitleWidget("合约规模(张)", "20000OTC", false),
          _getTitleWidget("最小变动单位", "0.00000003", true),
          _getTitleWidget("最小交易数量", "1", false),
          _getTitleWidget("可用杠杆数", "10%,10倍;5%,20倍;2%,50倍", true),
          _getTitleWidget("手续费率", "日内:单边万2.5\n跨日:单边万3.5", false),
          _getTitleWidget("最大止损比例", "85%", true),
          _getTitleWidget(
              "委托占用保证金",
              "买入:数量(手)*合约价值(手)*买入委托价格*保障金率\n卖出:数量(手)*合约价值(手)*卖出委托价格*保障金率",
              false),
          _getTitleWidget(
              "盈亏计算",
              "做多:数量(手)*合约价值(手)*(买一价-开仓价格) \n做空:数量(手)*合约价值(手)*(开仓价-卖一价) ",
              true),
          _getTitleWidget("强平条件", "浮动盈亏<=止损金额 \n浮动盈亏<=止盈金额", false),
        ],
      ),
    );
  }

  double _leftWidth = ScreenUtil.screenWidthDp * 0.35;
  double _rightWidth = ScreenUtil.screenWidthDp * 0.65;

  _getTitleWidget(title, desc, isWhite) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      color: isWhite ? kAppWhiteColor : kSubBtnColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MySuperWidget(
              width: _leftWidth - 20,
              alignment: Alignment.centerLeft,
              text: title,
              textColor: kAppSubTextColor,
              fontSize: fontSizeSmall),
          MySuperWidget(
              alignment: Alignment.centerLeft,
              width: _rightWidth,
              text: desc,
              textColor: kAppTextColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSizeSmall),
        ],
      ),
    );
  }
}
