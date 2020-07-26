import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 600), vsync: this); //AnimationController

    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    animation2 =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
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
      appBar: YPAppBar( "title.quotes", hasBackBtn: false,actions: [
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

              return QuotesItemWidget(color: index%2==0 ? animation.value:animation2.value);
            },
            itemCount: 7,
            padding: EdgeInsets.all(15),
          ),
          onRefresh: () {},
        ),),
    );
  }
}
