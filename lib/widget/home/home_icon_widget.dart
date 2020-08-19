import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';

import 'home_item.dart';

class HomeIconWidget extends StatelessWidget {
  final String name;
  final String url;

  const HomeIconWidget({Key key, this.name, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: kAppWhiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          HomeItemWidget(
            name: "帮助中心",
          ),
          HomeItemWidget(
            name: "福利中心",
          ),
          HomeItemWidget(
            name: "在线客服",
          ),
        ],
      ),
    );
  }
}
