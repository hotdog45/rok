import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio_log/overlay_draggable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/event/index.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/i18n_utils.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/user/mine_page.dart';

import '../assets_page.dart';
import '../home_page.dart';
import '../quotes_list_page.dart';
import '../test_page.dart';
import '../transaction_page.dart';

class MainPage extends StatefulWidget {
  static final String sName = "main";
  final int selIndex;

  @override
  _MainPageState createState() => _MainPageState();

  MainPage(this.selIndex);
}

class _MainPageState extends State<MainPage> {
  final List<Widget> tabBodies = [
    HomePage(),
    QuotesListPage(),
    TransactionPage(),
//    AssetsPage(),
    MinePage(),
  ];

  int currentIndex = 0;
  var currentPage;
  int badgeValue = 0;
  String _apiType = "";

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selIndex ?? 0;
    currentPage = tabBodies[currentIndex];

    eventBus.on<SelTabEvent>().listen((SelTabEvent event) {
      currentIndex = event.indexSel;
      setState(() {});
    });
    showDebugBtn(context);

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(initConnectivity);

  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: 1),
        child: Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          items: _getBottomList(),
          currentIndex: currentIndex,
          activeColor: kAppThemeColor,
          inactiveColor: kAppTextColor,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[index];
            });
          },
        ),
        body: WillPopScope(
          onWillPop: doubleClickBack,
          child: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        ),
        floatingActionButton: !Config.DEBUG
            ? Container()
            : InkWell(
                child: Icon(
                  Icons.build,
                  size: 50,
                ),
                onTap: () {
                  NavigatorUtils.navigatorRouter(context, TestPage());
                },
              ),
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomList() {
    List<BottomNavigationBarItem> bottomTabs = [
      _getBottomNavigationBarItem(
          "tab_home_unSel.png", "tab_home_sel.png", I18nUtils.translate(context, "title.home")),
      _getBottomNavigationBarItem(
          "tab_category_unSel.png", "tab_category_sel.png", I18nUtils.translate(context, "title.quotes")),

      _getBottomNavigationBarItem(
          "tab_order_unSel.png", "tab_order_sel.png", I18nUtils.translate(context, "title.contract")),
//      _getBottomNavigationBarItem(
//          "tab_mine_unSel.png", "tab_mine_sel.png", I18nUtils.translate(context, "title.assets")),
      _getBottomNavigationBarItem(
          "tab_mine_unSel.png", "tab_mine_sel.png", I18nUtils.translate(context, "title.mine")),
    ];

    return bottomTabs;
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(image, imageSel, title) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          Config.KEY_IMAGE_PATH + image,
          width: iconSize,
        ),
        activeIcon: Image.asset(
          Config.KEY_IMAGE_PATH + imageSel,
          width: iconSize,
        ),
        title: Text("$title$_apiType", style: bottomNavTextStyle()));
  }

//底部导航栏的样式
  TextStyle bottomNavTextStyle() => TextStyle(fontSize: 11);
  double iconSize = 22;
  int last = 0;
  Future<bool> doubleClickBack() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 1000) {
      last = DateTime.now().millisecondsSinceEpoch;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  initConnectivity(ConnectivityResult connectivityResult) {
    eventBus.fire(NoNet(connectivityResult == ConnectivityResult.none));
    print("connectivityResult" + connectivityResult.toString());
  }

  // 释放掉Timer
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
