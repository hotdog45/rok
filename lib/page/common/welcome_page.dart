import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/unils/dialog_utils.dart';
import 'package:rok/common/unils/local_storage.dart';

import '../user/login_page.dart';
import 'main_page.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    dialogUtils.reqCheckAppUpgrade(context, initParams);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 3), () {
      if (!isOpen){
        initParams();
      }
    });

  }

  initParams() async {
    isOpen = true;
    String token = await LocalStorage.get(Config.USER_TOKEN) ?? "";
    if (token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, MainPage.sName);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.sName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "static/images/welcome_image.png",
          scale: 0.5,
        ),
      ),
    );
  }

}
