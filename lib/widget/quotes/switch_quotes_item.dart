import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/quotes_details_page.dart';
import 'package:rok/widget/common/my_super_widget.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: quotes_item_widget
/// Author: lishunfeng
/// Date: 2020/7/26 3:55 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class SwitchQuotesItemWidget extends StatefulWidget {
  @override
  _SwitchQuotesItemWidgetState createState() => _SwitchQuotesItemWidgetState();
}

class _SwitchQuotesItemWidgetState extends State<SwitchQuotesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorUtils.navigatorRouter(context, QuotesDetailsPage());
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            border: Border.all(
                color: kSubBtnColor, width: 0.5, style: BorderStyle.solid)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MySuperWidget(
              margin: EdgeInsets.only(left: 10),
              text: "BTC/USDT 永续",
              fontWeight: FontWeight.w500,
              fontSize: fontSizeSmall,
              textColor: kAppTextColor,
            ),
            Expanded(
              child: MySuperWidget(
                text: "111123.99",
                fontSize: fontSizeMin,
                alignment: Alignment.center,
                textColor: kGreenColor,
              ),
            ),
            MySuperWidget(
              text: "-3.87%",
              margin: EdgeInsets.only(right: 10),
              fontSize: fontSizeMin,
              textColor: kGreenColor,
            ),
          ],
        ),
      ),
    );
  }
}
