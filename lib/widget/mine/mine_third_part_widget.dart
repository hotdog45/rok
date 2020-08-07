import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/i18n_utils.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/safe_center_page.dart';

class MineThirdPartWidget extends StatefulWidget {
  @override
  _MineThirdPartWidgetState createState() => _MineThirdPartWidgetState();
}

class _MineThirdPartWidgetState extends State<MineThirdPartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kAppWhiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: <Widget>[


          InkWell(child:     Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "static/images/safety.png",
                  height: 55,
                  width: 55,
                ),
                Text(
                  "安全中心",
                  style: TextStyle(
                    fontSize: fontSizeMiddle,
                    color: kAppTextColor,
                  ),
                )
              ],
            ),
          ),onTap: (){
            NavigatorUtils.navigatorRouter(context, SafeCenterPage());
          },),





          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "static/images/safety.png",
                    height: 55,
                    width: 55,
                  ),
                  Text(
                    "账单明细",
                    style: TextStyle(
                      fontSize: fontSizeMiddle,
                      color: kAppTextColor,
                    ),
                  )
                ],
              ),
            ),
          ),


          Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "static/images/safety.png",
                  height: 55,
                  width: 55,
                ),
                Text(
                  "我的邀请",
                  style: TextStyle(
                    fontSize: fontSizeMiddle,
                    color: kAppTextColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
