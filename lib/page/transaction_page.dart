import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/roundUnderlineTabIndicator.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> with SingleTickerProviderStateMixin{



  @override
  void initState() {
    // TODO: implement initState
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
      appBar: YPAppBar("USDT合约（永续）",hasBackBtn: false).build(context),
      body:
      Container(
        child: ListView(
          children: <Widget>[

            Container(
              height: 45,
              color: Colors.white,
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: <Widget>[
                  Icon(FlutterIcons.list_bullet_fou,color: kAppTextColor,),
                  Expanded(
                    child: Text(
                      "OTC-USDT 永续",
                      style: TextStyle(color: kAppTextColor, fontSize:fontSize16,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(child: Icon(FlutterIcons.sound_mix_ent),margin: EdgeInsets.only(right: 10),),
                  Icon(FlutterIcons.more_horiz_mdi),
                ],
              ),
            ),
            _tabBar(),
            Container(width: double.infinity, height: 450, child: _tabBarView())


          ],
        ),
      ),
    );
  }




  Widget _tabBar() {
    return TabBar(
//        isScrollable:true,
      //控制器
        controller: mController,
        //设置tab文字得类型
        labelStyle: TextStyle(fontSize: fontSize14, fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.black,
        //设置tab未选中得颜色
        unselectedLabelColor: Colors.black45,
        indicator: RoundUnderlineTabIndicator(
            borderSide: BorderSide(
              width: 3,
              color: kAppThemeColor,
            )),
        tabs: tabTitles.map((item) {
          return Tab(text: item);
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        return Container(
          color: randomColor(),
          child: Center(
            child: Text(item,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        );
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
