import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/quotes_details_page.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: home_quotes_item
 * Author: lishunfeng
 * Date: 2020/7/26 6:25 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class HomeQuotesItem extends StatelessWidget {
  final Color color;

  const HomeQuotesItem({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          NavigatorUtils.navigatorRouter(context, QuotesDetailsPage());
        },
        child: Container(
          width: ScreenUtil.screenWidthDp / 3,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color,
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "BTC/USDT",
                style: TextStyle(
                    fontSize: fontSize18,
                    fontWeight: FontWeight.bold,
                    color: kAppTextColor),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 6),
                child: Text(
                  "49.5056",
                  style: TextStyle(
                      fontSize: fontSize20,
                      fontWeight: FontWeight.bold,
                      color: kGreenColor),
                ),
              ),
              Expanded(
                child: Text(
                  "49.5056",
                  style: TextStyle(
                      fontSize: fontSize14,
                      fontWeight: FontWeight.bold,
                      color: kGreenColor),
                ),
              ),
              Container(
                width: 100,
                height: 25,
                decoration: BoxDecoration(
                    color: kGreenColor, borderRadius: BorderRadius.circular(3)),
                alignment: Alignment.center,
                child: Text(
                  "49.5056",
                  style: TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
                ),
              ),
            ],
          ),
        ));
  }
}
