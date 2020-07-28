import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/iconfont.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/i18n_utils.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/assets_page.dart';
import 'package:rok/page/quotes_details_page.dart';

class AssetsWidget extends StatefulWidget {
  @override
  _AssetsWidgetState createState() => _AssetsWidgetState();
}

class _AssetsWidgetState extends State<AssetsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: kAppWhiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              width: ScreenUtil.screenWidthDp,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "总资产折合 >",
                style:
                    TextStyle(fontSize: fontSizeSmall, color: kAppSubTextColor),
              ),
            ),
            onTap: () {
              NavigatorUtils.navigatorRouter(context, AssetsPage());
            },
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              width: ScreenUtil.screenWidthDp,
              child: Text(
                "88888888.000000" + "BTC",
                style: TextStyle(
                    fontSize: fontSizeNormal,
                    color: kAppTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              NavigatorUtils.navigatorRouter(context, AssetsPage());
            },
          ),
          InkWell(
            child: Container(
              width: ScreenUtil.screenWidthDp,
              margin: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "≈0.00000000",
                style: TextStyle(fontSize: fontSizeSmall, color: kAppTextColor),
              ),
            ),
            onTap: () {
              NavigatorUtils.navigatorRouter(context, AssetsPage());
            },
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Icon(
                    FlutterIcons.account_circle_outline_mco,
                    size: 20,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 5),
                  child: Text(
                    I18nUtils.translate(context, "button.deposit"),
                    style: TextStyle(
                      fontSize: fontSizeMiddle,
                      color: kAppTextColor,
                    ),
                  )),
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Icon(
                    FlutterIcons.account_circle_outline_mco,
                    size: 20,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 5, right: 50),
                  child: Text(
                    I18nUtils.translate(context, "button.withdrawal"),
                    style: TextStyle(
                      fontSize: fontSizeMiddle,
                      color: kAppTextColor,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
