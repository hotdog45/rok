import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: line_widget
/// Author: lishunfeng
/// Date: 2020/7/30 10:27 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class LineWidget extends StatelessWidget {
  final Color color;
  final double height;

  const LineWidget(
      {Key key, this.color = const Color(0xFFEDF3FF), this.height = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
    );
  }
}
