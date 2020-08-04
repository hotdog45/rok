import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/my_tab_bar.dart';
import 'package:rok/widget/common/pop_up_menu.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/transaction/position_list_widget.dart';
import 'package:rok/widget/transaction/transaction_widget.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
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
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: YPAppBar("USDT合约（永续）", hasBackBtn: false).build(context),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 45,
              color: Colors.white,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    FlutterIcons.list_bullet_fou,
                    color: kAppTextColor,
                  ),
                  Expanded(
                    child: Text(
                      "OTC-USDT 永续",
                      style: TextStyle(
                          color: kAppTextColor,
                          fontSize: fontSizeMiddle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  MySuperWidget(
                    child: Icon(FlutterIcons.sound_mix_ent),
                    onTap: () {

                    },
                  ),
                  MyPopupMenuBtn(),
                ],
              ),
            ),
            MyTabBar(mController: mController, tabTitles: tabTitles),
            Container(
                width: double.infinity, height: 1450, child: _tabBarView())
          ],
        ),
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.asMap().keys.map((index) {
        switch (index) {
          case 0:
            return TransactionWidget();
          case 1:
            return PositionListWidget();
          case 2:
            return PositionListWidget();
          case 3:
            return PositionListWidget();
          default:
            return Container();
        }
      }).toList(),
    );
  }

  TabController mController;
  List<String> tabTitles = [
    "交易",
    "持仓",
    "委托",
    "历史记录",
  ];
}
