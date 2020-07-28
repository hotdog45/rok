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

class HomeQuotesList extends StatefulWidget {
  final Color color;

  const HomeQuotesList({Key key, this.color:Colors.white}) : super(key: key);

  @override
  _HomeQuotesListState createState() => _HomeQuotesListState();
}

class _HomeQuotesListState extends State<HomeQuotesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppWhiteColor,
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return HomeQuotesItem(
              color:widget.color);
        },
        itemCount: 7,
      ),
    );
  }
}



class HomeQuotesItem extends StatelessWidget {
  final Color color;

  const HomeQuotesItem({Key key, this.color:Colors.white}) : super(key: key);

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
                    fontSize: fontSizeNormal,
                    fontWeight: FontWeight.bold,
                    color: kAppTextColor),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 6),
                child: Text(
                  "9649.50",
                  style: TextStyle(
                      fontSize: fontSizeNormal,
                      fontWeight: FontWeight.w600,
                      color: kGreenColor),
                ),
              ),
              Expanded(
                child: Text(
                  "9.05%",
                  style: TextStyle(
                      fontSize: fontSizeSmall,
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
                  "≈¥56522.222",
                  style: TextStyle(fontSize: fontSizeSmall, color: kAppWhiteColor),
                ),
              ),
            ],
          ),
        ));
  }
}
