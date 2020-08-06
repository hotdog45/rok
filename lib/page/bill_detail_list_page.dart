import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/widget/asset/bill_item_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class BillDetailListPage extends StatefulWidget {
  @override
  _BillDetailListPageState createState() => _BillDetailListPageState();
}

class _BillDetailListPageState extends State<BillDetailListPage> {
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
}
