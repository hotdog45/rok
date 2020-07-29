import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/my_super_widget.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: transaction_widget
 * Author: lishunfeng
 * Date: 2020/7/28 8:55 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class TransactionWidget extends StatefulWidget {
  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[_leftWidget(), _rightWidget()],
            ),
          ),
          _listWidget()
        ],
      ),
    );
  }

  _leftWidget() {
    return Container(
      color: Colors.white,
      width: ScreenUtil.screenWidthDp / 2,
      height: 430,
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
                bgColor: kAppColor("#EDF3FF"),
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
                        "限价 ",
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
                    NavigatorUtils.showToast("限价");
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
          _getTextFieldAndBtn(controller, "价格", "USDT", "限价"),
          _getTextFieldAndBtn(controller1, "数量", "手", "手数"),
          Container(
            height: 30,
            child: Slider(
                value: _value,
                min: 0,
                max: 100,
                divisions: 4,
                label: '${_value}%',
                activeColor: kAppThemeColor,
                inactiveColor: kAppSub2TextColor,
                onChangeStart: (value) {
                  print('开始滑动:$value');
                },
                onChangeEnd: (value) {
                  print('滑动结束:$value');
                },
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
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
            onTap: () {
              NavigatorUtils.showToast("开空");
            },
          ),
        ],
      ),
    );
  }

  _rightWidget() {
    return Container(
      color: Colors.white,
      width: ScreenUtil.screenWidthDp / 2,
      height: 430,
      child: Column(
        children: <Widget>[
          _getTextItem("价格", "数量(手)"),
          _getMarketItem("3949.33", "2332.22k", false, 0.3),
          _getMarketItem("3949.33", "2332.22k", false, 0.1),
          _getMarketItem("3949.33", "2332.22k", false, 0.1),
          _getMarketItem("3949.33", "2332.22k", false, 0.9),
          _getMarketItem("3949.33", "2332.22k", false, 0.3),
          _getMarketItem("3949.33", "2332.22k", false, 0.6),

          




          _getMarketItem("3949.33", "2332.22k", true, 0),
          _getMarketItem("3949.33", "2332.22k", true, 0.9),
          _getMarketItem("3949.33", "2332.22k", true, 0.6),
          _getMarketItem("3949.33", "2332.22k", true, 0.4),
          _getMarketItem("3949.33", "2332.22k", true, 0.3),
          _getMarketItem("3949.33", "2332.22k", true, 0.1),

        ],
      ),
    );
  }

  _listWidget() {
    return Container(
      height: 450,
      color: Colors.deepOrangeAccent,
    );
  }

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
        width: ScreenUtil.screenWidthDp / 2,
        height: 30,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  color: isGreen ?kGreenSubColor:kRedSubColor,
                  width: ScreenUtil.screenWidthDp / 2 * num,
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

  _getPercentageWidget(num, {last = false}) {
    return Expanded(
      child: MySuperWidget(
        text: num,
        textColor: kAppTextColor,
        fontSize: fontSizeMin,
        borderColor: kAppSub2TextColor,
        borderWidth: 0.5,
        radius: 2,
        margin: EdgeInsets.only(right: last ? 0 : 10),
        hasBorder: true,
        onTap: () {
          NavigatorUtils.showToast("杠杆");
        },
      ),
    );
  }

  _getTextFieldAndBtn(controller, hintText, sku, title) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil.screenWidthDp / 3,
            decoration: BoxDecoration(
                border: Border.all(color: kAppSub2TextColor, width: 0.5),
                borderRadius: BorderRadius.circular(2)),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: ScreenUtil.screenWidthDp / 3 - 90,
                  height: 30,
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: controller,
                    maxLines: 1, //最大行数
                    decoration: InputDecoration.collapsed(hintText: hintText),
                    style: TextStyle(
                        fontSize: fontSizeMiddle,
                        color: kAppTextColor,
                        fontWeight: FontWeight.bold), //输入文本的样式
                    onChanged: (text) {
                      //内容改变的回调
                      print('change $text');
                    },
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
                      TextStyle(color: kAppTextColor, fontSize: fontSizeMiddle),
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
