import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/model/mine/asset_record_list_model.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/widget/asset/bill_item_widget.dart';
import 'package:rok/widget/common/refresh_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class BillDetailListPage extends StatefulWidget {
  @override
  _BillDetailListPageState createState() => _BillDetailListPageState();
}

class _BillDetailListPageState extends State<BillDetailListPage> {
  int pageIndex = 1;
  int pageSize = 10;
  List<AssetList> _datas = [];
  AssetRecordListModel assetRecordListModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recordList(null, pageIndex, pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YPAppBar(
          "账单明细",
        ).build(context),
        body: MyRefresh(

          child:
          _datas==null||_datas.length<1?Container():
          ListView.builder(
              itemCount: _datas.length,
              // itemExtent: 100.0, //强制高度为50.0
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                AssetList al = _datas[index];
                return GestureDetector(
                  child: BillItemWidget(assetList: al),
                );
              }),
          onRefresh: () async {
            pageIndex = 1;
            _datas = null;
            _recordList(null, pageIndex, pageSize);
          },
          onLoad: () async {
            pageIndex++;
            _recordList(null, pageIndex, pageSize);
          },

        )

//      ListView(
//        children: <Widget>[
//          BillItemWidget(),
//          BillItemWidget(),
//
//        ],
//      ),
        );
  }

  void _recordList(int bizType, int pageNo, int pageSize) async {
    ///asset/record/list
    var data = await recordList(bizType, pageNo, pageSize);
// if(pageIndex==1){
//   assetRecordListModel = AssetRecordListModel.fromJson(data);
//   _datas = assetRecordListModel.list;
// }else{
//
// }
    assetRecordListModel=AssetRecordListModel.fromJson(data);
    _datas.addAll(assetRecordListModel.list) ;

    setState(() {});
    return;
  }
}
