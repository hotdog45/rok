import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';

class SafeCenterPage extends StatefulWidget {
  @override
  _SafeCenterPageState createState() => _SafeCenterPageState();
}

class _SafeCenterPageState extends State<SafeCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "安全中心",
      ).build(context),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20),
              child: MineItemWidget(
                theme: "手机验证",
                type: 7,
                rightAction: "159****3544",
              )),
          MineItemWidget(
            theme: "邮箱验证",
            type: 8,
            rightAction: "未绑定",
          ),
          MineItemWidget(
            theme: "谷歌验证",
            type: 8,
            rightAction: "未绑定",
          ),
          MineItemWidget(
            theme: "登录密码",
            type: 8,
            rightAction: "修改",
          ),
          MineItemWidget(
            theme: "资金密码",
            type: 8,
            rightAction: "未设置",
          ),
          MineItemWidget(
            theme: "安全通知",
            type: 9,
          ),
          MineItemWidget(
            theme: "手势密码",
            type: 10,
          ),
          MineItemWidget(
            theme: "指纹密码",
            type: 10,
          )
        ],
      ),
    );
  }
}
