import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/model/contract/entrust_model.dart';
import 'package:rok/common/model/home/operation_records_model.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/custom_action_sheet.dart';
import 'package:rok/widget/common/my_slider.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/my_tab_bar.dart';
import 'package:rok/widget/common/round_slider_track_shape.dart';

import 'position_list_widget.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: transaction_widget
/// Author: lishunfeng
/// Date: 2020/7/28 8:55 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class TransactionWidget extends StatefulWidget {
  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget>
    with SingleTickerProviderStateMixin {
  var priceType = 0;
  List<EntrustModel> list;
  final priceTypeMap = {
    0: "限价",
    1: "市价",
    2: "计划委托",
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );

  }




  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBcgColor,
      child: Column(
        children: <Widget>[
          Container(
            height: 440,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[_leftWidget(), _rightWidget()],
            ),
          ),
          MyTabBar(mController: mController, tabTitles: tabTitles),
          Container(width: double.infinity, height: 2050, child: _tabBarView())
        ],
      ),
    );
  }

  _leftWidget() {
    return Container(
      color: Colors.white,
      width: _leftWidth,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: MySuperWidget(
                text: "开仓",
                textColor: kAppWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSizeMiddle,
                radius: 4,
                bgColor: kGreenColor,
                height: 40,
                onTap: () {
                  NavigatorUtils.showToast("开仓");
                },
              )),
              Container(width: 10),
              Expanded(
                  child: MySuperWidget(
                text: "平仓",
                textColor: kAppTextColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSizeMiddle,
                radius: 4,
                bgColor: kSubBtnColor,
                height: 40,
                onTap: () {
                  NavigatorUtils.showToast("平仓");
                },
              ))
            ],
          ),
          Container(
            height: 40,
            child: Row(
              children: <Widget>[
                MySuperWidget(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        priceTypeMap[priceType] + " ",
                        style: TextStyle(
                            color: kAppTextColor, fontSize: fontSizeSmall),
                      ),
                      Icon(
                        FlutterIcons.caretdown_ant,
                        size: 13,
                        color: kAppSubTextColor,
                      )
                    ],
                  ),
                  textColor: kAppWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeMiddle,
                  onTap: () {
                    CustomActionSheet.show(
                        context, priceTypeMap.values.toList(),
                        cancel: "取消",
                        title: "提示",
                        sel: priceTypeMap[priceType], callBack: (e) {
                      priceTypeMap.forEach((key, value) {
                        if (value == e) priceType = key as int;
                        setState(() {});
                      });
                    });
                  },
                ),
                Expanded(child: Container()),
                MySuperWidget(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "杠杆 50X ",
                        style: TextStyle(
                            color: kAppTextColor, fontSize: fontSizeSmall),
                      ),
                      Icon(
                        FlutterIcons.caretdown_ant,
                        size: 13,
                        color: kAppSubTextColor,
                      )
                    ],
                  ),
                  textColor: kAppWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeMiddle,
                  onTap: () {
                    NavigatorUtils.showToast("杠杆");
                  },
                )
              ],
            ),
          ),
          _getTextFieldAndBtn(controller, "价格", "USDT", "限价", hasMargin: true),
          _getTextFieldAndBtn(controller1, "数量", "手", "手数"),
          MySlider(
            value: _value,
            onChanged: (v) {
              setState(() {
                _value = v;
              });
            },
          ),
          Container(
            height: 20,
            child: Row(
              children: <Widget>[
                _getPercentageWidget("25%"),
                _getPercentageWidget("50%"),
                _getPercentageWidget("75%"),
                _getPercentageWidget("100%", last: true),
              ],
            ),
          ),
          _getTextItem("占用保证金", "0"),
          _getTextItem("可开手数", "<1"),
          MySuperWidget(
            height: 44,
            text: "开多",
            textColor: kAppWhiteColor,
            fontSize: fontSizeMiddle,
            bgColor: kGreenColor,
            radius: 4,
            margin: EdgeInsets.only(top: 10),
            onTap: () {
              NavigatorUtils.showToast("开多");
              daoTradeOpen("BTCUSDT", 1, 100, 38000, 10000, 1, 0);
              
              
            },
          ),
          MySuperWidget(
            height: 44,
            text: "开空",
            textColor: kAppWhiteColor,
            fontSize: fontSizeMiddle,
            bgColor: kRedColor,
            radius: 4,
            margin: EdgeInsets.only(top: 10),
            onTap: () async{
              // NavigatorUtils.showToast("开空"+list[0].toJson().toString());

            },
          ),
        ],
      ),
    );
  }

  double _rightWidth = ScreenUtil.screenWidthDp * 0.4;
  double _leftWidth = ScreenUtil.screenWidthDp * 0.6;

  _rightWidget() {
    return Container(
      color: Colors.white,
      width: _rightWidth,
      child: Column(
        children: <Widget>[
          _getTextItem("价格", "数量(手)"),
          _getMarketItem("3949.33", "2332.22k", false, 0.3),
          _getMarketItem("3949.33", "2332.22k", false, 0.1),
          _getMarketItem("3949.33", "2332.22k", false, 0.1),
          _getMarketItem("3949.33", "2332.22k", false, 0.9),
          _getMarketItem("3949.33", "2332.22k", false, 0.3),
          _getMarketItem("3949.33", "2332.22k", false, 0.6),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "75.9998",
                  style: TextStyle(
                      color: kGreenColor,
                      fontSize: fontSizeMiddle,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: "≈¥527.816",
                  style: TextStyle(
                      color: kAppTextColor,
                      fontSize: fontSizeMin,
                      fontWeight: FontWeight.w500)),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "最新指数",
                  style: TextStyle(
                      color: kAppSubTextColor, fontSize: fontSizeMin)),
              TextSpan(
                  text: "75.9002",
                  style: TextStyle(
                      color: kAppTextColor,
                      fontSize: fontSizeMin,
                      fontWeight: FontWeight.w500)),
            ]),
          ),
          _getMarketItem("3949.33", "2332.22k", true, 0),
          _getMarketItem("3949.33", "2332.22k", true, 0.9),
          _getMarketItem("3949.33", "2332.22k", true, 0.6),
          _getMarketItem("3949.33", "2332.22k", true, 0.4),
          _getMarketItem("3949.33", "2332.22k", true, 0.3),
          _getMarketItem("3949.33", "2332.22k", true, 0.1),
          Container(
            height: 25,
            child: Row(
              children: <Widget>[
                _getPercentageWidget("4位", callBack: () {}, isSel: true),
                _getPercentageWidget("3位", callBack: () {}, isSel: false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.asMap().keys.map((index) {
        switch (index) {
          case 0:
            return PositionListWidget(type: 0,);
          case 1:
            return PositionListWidget(type: 2,);
          default:
            return PositionListWidget(type: 3,);
        }
      }).toList(),
    );
  }

  TabController mController;
  List<String> tabTitles = [
    "持仓",
    "普通委托",
    "计划委托",
  ];

  double _value = 0;

  final controller = TextEditingController();
  final controller1 = TextEditingController();

  _getTextItem(title, desc) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: TextStyle(color: kAppTextColor, fontSize: fontSizeMin)),
            Text(desc,
                style: TextStyle(color: kAppTextColor, fontSize: fontSizeMin)),
          ],
        ));
  }

  _getMarketItem(title, desc, isGreen, num) {
    return Container(
        width: _rightWidth,
        height: 27,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  color: isGreen ? kGreenSubColor : kRedSubColor,
                  width: _rightWidth * num,
                ),
              ],
            ),
            Container(
              height: 30,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: isGreen ? kGreenColor : kRedColor,
                          fontSize: fontSizeMin)),
                  Text(desc,
                      style: TextStyle(
                          color: kAppTextColor, fontSize: fontSizeMin)),
                ],
              ),
            ),
          ],
        ));
  }

  //百分比
  _getPercentageWidget(num, {last = false, callBack, isSel = false}) {
    return Expanded(
      child: MySuperWidget(
        text: num,
        textColor: kAppTextColor,
        fontSize: fontSizeMin,
        borderColor: isSel ? kSubBtnColor : kAppSub2TextColor,
        borderWidth: 0.5,
        bgColor: isSel ? kSubBtnColor : kAppClearColor,
        radius: 2,
        margin: EdgeInsets.only(right: last ? 0 : 10),
        hasBorder: true,
        onTap: callBack,
      ),
    );
  }

  _getTextFieldAndBtn(controller, hintText, sku, title,
      {hasMargin = false, onChanged}) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(bottom: hasMargin ? 14 : 0),
      child: Row(
        children: <Widget>[
          Container(
            width: _leftWidth - 80,
            decoration: BoxDecoration(
                border: Border.all(color: kAppSub2TextColor, width: 0.5),
                borderRadius: BorderRadius.circular(2)),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: _leftWidth - 140,
                  height: 30,
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    //最大行数
                    decoration: InputDecoration.collapsed(hintText: hintText),
                    style: TextStyle(
                        fontSize: fontSizeMiddle,
                        color: kAppTextColor,
                        fontWeight: FontWeight.bold),
                    //输入文本的样式
                    onChanged: onChanged,
                    onSubmitted: (text) {
                      //内容提交(按回车)的回调
                      print('submit $text');
                    },
                    enabled: true, //是否禁用
                  ),
                ),
                Text(
                  sku,
                  style:
                      TextStyle(color: kAppTextColor, fontSize: fontSizeSmall),
                )
              ],
            ),
          ),
          Container(
            width: 3,
          ),
          Expanded(
              child: MySuperWidget(
            text: title,
            borderColor: kAppSub2TextColor,
            borderWidth: 0.5,
            radius: 2,
            hasBorder: true,
          ))
        ],
      ),
    );
  }
}
