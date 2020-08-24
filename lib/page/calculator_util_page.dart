import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/calculator/Liquidation_calculator.dart';
import 'package:rok/widget/calculator/profile_calculator_widget.dart';
import 'package:rok/widget/calculator/target_price_calculator_widget.dart';
import 'package:rok/widget/common/my_tab_bar.dart';

class CalculatorUtilPage extends StatefulWidget {
  @override
  _CalculatorUtilPageState createState() => _CalculatorUtilPageState();
}

class _CalculatorUtilPageState extends State<CalculatorUtilPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [kAppWhiteColor, kAppWhiteColor]),
      ),
      child: ListView(
        children: <Widget>[
          MyTabBar(mController: mController, tabTitles: tabTitles),
          Container(
              width: double.infinity,
              height: ScreenUtil.screenHeightDp,
              child: _tabBarView())
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.asMap().keys.map((index) {
        switch (index) {
          case 0:
            return ProfileCalculatorWidget();
          case 1:
            return TargetPriceCalculatorWidget();
          case 2:
            return LiquidationCalculatorWidget();
          default:
            return Container();
        }
      }).toList(),
    );
  }

  TabController mController;
  List<String> tabTitles = [
    "收益计算",
    "目标价格计算",
    "强平价格",
  ];
}
