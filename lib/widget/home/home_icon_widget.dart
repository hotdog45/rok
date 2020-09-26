import 'package:flutter/material.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/style/style.dart';

import 'home_item.dart';

class HomeIconWidget extends StatelessWidget {
  final List<Menus> menus;

  const HomeIconWidget({Key key, this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: kAppWhiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menus.map((e) => HomeItemWidget(
          name: e.title,
          url: e.icon,
        )).toList(),
      ),
    );
  }
}
