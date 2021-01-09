import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rok/common/model/contract/entrust_model.dart';
import 'package:rok/common/model/position/position_model.dart';
import 'package:rok/common/net/rok_dao.dart';

import 'entrust_item_widget.dart';
import 'position_item_widget.dart';

/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: position_item_widget
/// Author: lishunfeng
/// Date: 2020/7/30 10:22 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

class PositionListWidget extends StatefulWidget {
  ///0 持仓  1全部持仓 2普通委托 3计划委托  5 全部委托 9历史记录
  final int type;
  final String code;
  const PositionListWidget({Key key, this.type, this.code = "BTCUSDT"})
      : super(key: key);

  @override
  _PositionListWidgetState createState() => _PositionListWidgetState();
}

class _PositionListWidgetState extends State<PositionListWidget> {
  List<EntrustModel> list;
  List<PositionModel> list2;

  @override
  void initState() {
    super.initState();
    getEntrustList();
  }

  getEntrustList() async {
    if (widget.type == 0) { //持仓
      list2 = await reqPositionList(contractCode: widget.code);
    } else if (widget.type == 1) {//全部持仓
      list2 = await reqPositionList();
    } else if (widget.type == 2) { //普通委托
      list = await reqEntrustList(contractCode: widget.code,typeList: [1,2]);
    } else if (widget.type == 3) { //计划委托
      list = await reqEntrustList(contractCode: widget.code,typeList: [3,4]);
    } else if (widget.type == 5) { // 全部委托
      list = await reqEntrustList();
    } else if (widget.type == 9) { //历史记录
      list = await daoEntrustHistoryList();
    }

    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return (widget.type < 2 ? list2 : list )== null
        ? Container()
        : Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                if (widget.type < 2){
                  return PositionItemWidget(positionModel: list2[index]);
                }
                return EntrustItemWidget(entrustModel: list[index]);
              },
              itemCount: widget.type < 2 ? list2.length :list.length,
            ),
          );
  }
}
