import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/widget/asset/bill_item_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class BillDetailListPage extends StatefulWidget {
  @override
  _BillDetailListPageState createState() => _BillDetailListPageState();
}

class _BillDetailListPageState extends State<BillDetailListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recordList(null,1,10);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "账单明细",
      ).build(context),
      body: ListView(
        children: <Widget>[
          BillItemWidget(),
          BillItemWidget(),
          BillItemWidget(),
          BillItemWidget(),
          BillItemWidget(),
          BillItemWidget(),
          BillItemWidget(),
          BillItemWidget(),
        ],
      ),
    );
  }


  void _recordList(int bizType,int pageNo,int pageSize) async {///asset/record/list
    var data = await recordList(bizType,pageNo,pageSize);
//    _previewModel = withdrawPreviewModel.fromJson(data);
    setState(() {});
    return;
  }

}
