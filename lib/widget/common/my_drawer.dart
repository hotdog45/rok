import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/quotes/quotes_item_widget.dart';
import 'package:rok/widget/quotes/switch_quotes_item.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: my_drawer
/// Author: lishunfeng
/// Date: 2020/8/4 8:34 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class MyDrawer extends StatefulWidget {
  final closeCallBack;

  const MyDrawer({Key key, this.closeCallBack}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 20,
        child: SafeArea(
          child: Column(
            //或者是Column
//            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "USDT合约",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeMiddle,
                        color: kAppThemeColor,
                      ),
                    ),
                    MySuperWidget(
                      child: Icon(FlutterIcons.close_ant),
                      onTap: () {
                        if (widget.closeCallBack != null) {
                          widget.closeCallBack();
                        } else {
                          Scaffold.of(context).openEndDrawer();
                        }
                      },
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
//                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return SwitchQuotesItemWidget();
                },
                itemCount: 7,
              )
            ],
          ),
        ));
  }
}
