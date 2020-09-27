import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/refresh_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/quotes/quotes_item_widget.dart';

class QuotesListPage extends StatefulWidget {
  @override
  _QuotesListPageState createState() => _QuotesListPageState();
}

class _QuotesListPageState extends State<QuotesListPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;

  List<Contracts> contracts;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 600),
        vsync: this); //AnimationController

    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    animation2 =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
//      print(animation.value);
    });

    getContractListData();
  }

  getContractListData() async {
    var jsonStr = await reqContractListData();
    print("jsonStr" + jsonStr.toString());

    List list = json.decode(jsonStr);

    contracts = list.map((e) => Contracts.fromJson(e)).toList();

    setState(() {});
    print("contracts" + contracts.length.toString());
  }

  void _onTapHandle() {
    controller.reset();
    animation =
        ColorTween(begin: Colors.green, end: Colors.white).animate(controller);
    controller.forward();
  }

  void _onTapHandle2() {
    controller.reset();
    animation2 =
        ColorTween(begin: Colors.red, end: Colors.white).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: YPAppBar("title.quotes", hasBackBtn: false, actions: [
        InkWell(
            child: Icon(Icons.refresh),
            onTap: () {
              _onTapHandle2();
            }),
        InkWell(
            child: Icon(Icons.gavel),
            onTap: () {
              _onTapHandle();
            }),
      ]).build(context),
      body: Container(
        color: kAppBcgColor,
        child: MyRefresh(
          child: ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return QuotesItemWidget(
                  color: index % 2 == 0 ? animation.value : animation2.value,contract: contracts[index],);
            },
            itemCount: contracts.length,
            padding: EdgeInsets.all(15),
          ),
          onRefresh: () {},
        ),
      ),
    );
  }
}
