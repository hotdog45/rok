import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: home_item
/// Author: lishunfeng
/// Date: 2020/7/26 7:31 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class HomeItemWidget extends StatelessWidget {
  final String name;
  final String url;

  const HomeItemWidget({Key key, this.name, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.network(
              url ??
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1850580561,3567696424&fm=26&gp=0.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            Text(
              name,
              style: TextStyle(fontSize: fontSizeSmall, color: kAppTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
