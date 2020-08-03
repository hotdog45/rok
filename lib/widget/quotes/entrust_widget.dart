import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/number_utils.dart';
import 'package:rok/widget/common/my_super_widget.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: entrust_wiget
 * Author: lishunfeng
 * Date: 2020/8/1 3:24 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class EntrustWidget extends StatefulWidget {
  @override
  _EntrustWidgetState createState() => _EntrustWidgetState();
}

class _EntrustWidgetState extends State<EntrustWidget> {
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
      child: Row(
        children: <Widget>[
          _getLeftMarketItem(1),
          _getRightMarketItem(1),
        ],
      ),
    );
  }

  _getTitleWidget() {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MySuperWidget(
              text: "买盘 数量(手)",
              textColor: kAppSubTextColor,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "价格",
              textColor: kAppSubTextColor,
              fontSize: fontSizeMin),
          MySuperWidget(
              text: "数量(手) 卖盘",
              textColor: kAppSubTextColor,
              fontSize: fontSizeMin),
        ],
      ),
    );
  }

  double _rightWidth = ScreenUtil.screenWidthDp * 0.5;

  _getLeftMarketItem(index) {
    var r = Random();
    var price = (NumberUtils.formatNum(r.nextInt(90000) / 23.0, 5)).toString();
    var number = r.nextInt(90000).toString();
    var num = r.nextInt(100) / 100;

    return Container(
        width: _rightWidth,
        height: 27,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  color: kGreenSubColor,
                  width: _rightWidth * num,
                ),
              ],
            ),
            Container(
              height: 30,
              child: Row(
                children: <Widget>[
                  MySuperWidget(
                      text: (index + 1).toString(),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      textColor: kAppSub2TextColor,
                      fontSize: fontSizeMin),
                  Expanded(
                    child: Text(number,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kAppBlackColor,
                            fontSize: fontSizeSmall)),
                  ),

                  MySuperWidget(
                      text: price,
                      margin: EdgeInsets.only(right: 5),
                      textColor: kGreenColor,
                      fontSize: fontSizeSmall),
                ],
              ),
            ),
          ],
        ));
  }

  _getRightMarketItem(index) {
    var r = Random();
    var price = (NumberUtils.formatNum(r.nextInt(90000) / 23.0, 5)).toString();
    var number = r.nextInt(90000).toString();
    var num = r.nextInt(100) / 100;

    return Container(
        width: _rightWidth,
        height: 27,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: kRedSubColor,
                  width: _rightWidth * num,
                ),
                Expanded(child: Container()),
              ],
            ),
            Container(
              height: 30,
              child: Row(
                children: <Widget>[

                  MySuperWidget(
                      text: price,
                      margin: EdgeInsets.only(left: 5),
                      textColor: kRedColor,
                      fontSize: fontSizeSmall),
                  Expanded(
                    child: Text(number,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kAppBlackColor,
                            fontSize: fontSizeSmall)),
                  ),
                  MySuperWidget(
                      text: (index + 1).toString(),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      textColor: kAppSub2TextColor,
                      fontSize: fontSizeMin),
                ],
              ),
            ),
          ],
        ));
  }
}
