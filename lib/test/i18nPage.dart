/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: i18nPage
/// Author: lishunfeng
/// Date: 2020/7/25 5:43 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

import 'package:flutter/material.dart';
import 'package:rok/common/unils/i18n_utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  Locale currentLang;
  int clicked = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await I18nUtils.refresh(context, LanguageEnum.Spain);
      setState(() {
        currentLang = I18nUtils.currentLocale(context);
      });
    });
  }

  incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I18nUtils.translate(context, "title"))),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(I18nUtils.plural(context, "clicked.times", clicked)),
              FlatButton(
                  onPressed: () async {
                    incrementCounter();
                  },
                  child: Text(I18nUtils.translate(context, "button.clickMe"))),
              FlatButton(
                  onPressed: () {
                    I18nUtils.refresh(context, LanguageEnum.French);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          I18nUtils.translate(context, "button.toastMessage")),
                    ));
                  },
                  child: Text(I18nUtils.translate(context, "button.clickMe")))
            ],
          ),
        );
      }),
    );
  }
}
