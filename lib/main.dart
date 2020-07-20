import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/unils/app_init_utils.dart';
import 'page/common/welcome_page.dart';

void main() {
  appInitUtils.initEasyLoading();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  appInitUtils.initAndroidSystemUI();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
//    appInitUtils.initFluwx();
//    appInitUtils.initUmeng();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: appInitUtils.appRoutes(),
        debugShowCheckedModeBanner: !kReleaseMode,
        theme: appInitUtils.initThemeData(),
        initialRoute: WelcomePage.sName);
  }
}
