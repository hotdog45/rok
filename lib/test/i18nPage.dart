/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: i18nPage
 * Author: lishunfeng
 * Date: 2020/7/25 5:43 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MyHomePage extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  Locale currentLang;
  int clicked = 0;

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () async {
      await FlutterI18n.refresh(context, new Locale('es'));
      setState(() {
        currentLang = FlutterI18n.currentLocale(context);
      });
    });
  }

  changeLanguage() {
    setState(() {
      currentLang = currentLang.languageCode == 'en'
          ? new Locale('en')
          : new Locale('zh');
    });
  }

  incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
      new AppBar(title: new Text(FlutterI18n.translate(context, "title"))),
      body: new Builder(builder: (BuildContext context) {
        return new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              I18nText("label.main",
                  translationParams: {"user": "Flutter lover"}),
              new Text(FlutterI18n.plural(context, "clicked.times", clicked)),
              new FlatButton(
                  onPressed: () async {
                    incrementCounter();
                  },
                  child: new Text(
                      FlutterI18n.translate(context, "button.clickMe"))),
              new FlatButton(
                  onPressed: () async {
                    changeLanguage();
                    await FlutterI18n.refresh(context, currentLang);
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(
                          FlutterI18n.translate(context, "toastMessage")),
                    ));
                  },
                  child: new Text(
                      FlutterI18n.translate(context, "button.clickMe")))
            ],
          ),
        );
      }),
    );
  }
}