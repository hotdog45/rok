import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rok/common/model/contract/entrust_model.dart';

import 'position_item_widget.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: position_item_widget
/// Author: lishunfeng
/// Date: 2020/7/30 10:22 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class PositionListWidget extends StatelessWidget {
  final List<EntrustModel> list;

  const PositionListWidget({Key key, this.list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list == null ? Container(): Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return PositionItemWidget(entrustModel:list[index]);
        },
        itemCount: list.length,
      ),
    );
  }
}
