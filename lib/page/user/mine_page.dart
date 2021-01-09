import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/common/constant/app_constant.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/common/unils/user_info_utils.dart';
import 'package:rok/widget/mine/account_widget.dart';
import 'package:rok/widget/mine/assets_widget.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';
import 'package:rok/widget/mine/mine_third_part_widget.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [kMineBgColor1, kMineBgColor]),
      ),
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          AccountWidget(),
          AssetsWidget(),
          MineThirdPartWidget(),
          MineItemWidget(
            theme: "在线客服",
            type: 4,
          ),
          MineItemWidget(
            theme: "建议反馈",
            type: 5,
          ),
          MineItemWidget(
            theme: "了解我们",
            type: 6,
          ),
        ],
      ),
    );
  }

}
