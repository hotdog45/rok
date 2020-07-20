import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class QuotesListPage extends StatefulWidget {
  @override
  _QuotesListPageState createState() => _QuotesListPageState();
}

class _QuotesListPageState extends State<QuotesListPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: YPAppBar("行情列表页",hasBackBtn: false).build(context),
      body: Center(child: Text("行情列表页")),
    );
  }
}
