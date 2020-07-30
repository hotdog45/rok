import 'package:flutter/material.dart';

import 'position_item_widget.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: position_item_widget
 * Author: lishunfeng
 * Date: 2020/7/30 10:22 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class PositionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return PositionItemWidget();
        },
        itemCount: 7,
      ),
    );
  }
}
