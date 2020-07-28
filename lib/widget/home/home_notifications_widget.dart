import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/common/style/style.dart';

import 'home_item.dart';

class HomeNotifWidget extends StatelessWidget {
  final String name;
  final String url;

  const HomeNotifWidget({Key key, this.name, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: kAppWhiteColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(color: kShadowColor, blurRadius: 10.0)]),
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Icon(
                FlutterIcons.ios_notifications_ion,
                color: kAppThemeColor,
                size: 22,
              )),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "跨日交易上线公告",
                    style:
                        TextStyle(fontSize: fontSizeSmall, color: kAppTextColor),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
              autoplay: true,
              itemCount: 3,
            ),
          ),
          Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
