import 'package:flutter/material.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: custom_action_sheet
 * Author: lishunfeng
 * Date: 2020/8/3 10:34 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

import 'package:flutter/cupertino.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';

class CustomActionSheet {
  static Widget getText(title, color) {
    return title.isEmpty
        ? null
        : Text(
            title,
            style: TextStyle(fontSize: fontSizeSmall, color: color),
          );
  }

  static Widget buildSheet(
          BuildContext context,
          List<String> list,
          String cancel,
          String title,
          String message,
          String sel,
          Function callBack(int)) =>
      Container(
        alignment: Alignment.bottomCenter,
        child: CupertinoActionSheet(
          title: getText(title, kAppBlackColor),
          message: getText(message, kAppTextColor),
          cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: getText(cancel, kAppTextColor)),
          actions: list
              .map((e) => CupertinoActionSheetAction(
                  onPressed: () {
                    callBack(e);
                    Navigator.pop(context);
                  },
                  child: getText(e, e == sel ? kAppThemeColor : kAppTextColor)))
              .toList(),
        ),
      );

  static show(BuildContext context, List<String> list,
      {String cancel = "",
      String title = "",
      String message = "",
      String sel = "",
      Function callBack(str)}) {
    showDialog(
        context: context,
        builder: (ctx) =>
            buildSheet(context, list, cancel, title, message, sel, callBack));
  }
}
