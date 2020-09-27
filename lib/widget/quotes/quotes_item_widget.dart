import 'package:flutter/material.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/quotes_details_page.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: quotes_item_widget
/// Author: lishunfeng
/// Date: 2020/7/26 3:55 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class QuotesItemWidget extends StatefulWidget {
  final Color color;

  final Contracts contract;

  const QuotesItemWidget({Key key,this.contract, this.color = Colors.white})
      : super(key: key);

  @override
  _QuotesItemWidgetState createState() => _QuotesItemWidgetState();
}

class _QuotesItemWidgetState extends State<QuotesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorUtils.navigatorRouter(context, QuotesDetailsPage());
      },
      child: Container(
        height: 65,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white,
                widget.color,
              ],
            ),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [BoxShadow(color: kShadowColor, blurRadius: 10.0)]),
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Image.network(
                widget.contract.icon,
                fit: BoxFit.fill,
              ),
              height: 22,
              width: 22,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.contract.symbol,
                    style: TextStyle(
                        fontSize: fontSizeNormal,
                        fontWeight: FontWeight.bold,
                        color: kAppTextColor),
                  ),
                  Text(
                    widget.contract.code,
                    style: TextStyle(
                        fontSize: fontSizeSmall, color: kAppSub2TextColor),
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "49.5056",
                    style: TextStyle(
                        fontSize: fontSizeMiddle,
                        fontWeight: FontWeight.bold,
                        color: kGreenColor),
                  ),
                  Text(
                    "≈¥2345.22",
                    style: TextStyle(
                        fontSize: fontSizeSmall, color: kAppSubTextColor),
                  ),
                ],
              ),
              flex: 3,
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Text(
                "+4.77%",
                style: TextStyle(
                    fontSize: fontSizeNormal,
                    fontWeight: FontWeight.w500,
                    color: kGreenColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
