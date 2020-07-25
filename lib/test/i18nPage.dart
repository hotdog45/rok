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
import 'package:rok/common/unils/i18n_utils.dart';


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
    return new Scaffold(
      appBar:
      new AppBar(title: new Text(I18nUtils.translate(context, "title"))),
      body: new Builder(builder: (BuildContext context) {
        return new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(I18nUtils.plural(context, "clicked.times", clicked)),
              new FlatButton(
                  onPressed: () async {
                    incrementCounter();
                  },
                  child: new Text(
                      I18nUtils.translate(context, "button.clickMe"))),
              new FlatButton(
                  onPressed: ()  {
                    I18nUtils.refresh(context, LanguageEnum.French);
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(
                          I18nUtils.translate(context, "button.toastMessage")),
                    ));
                  },
                  child: new Text(
                      I18nUtils.translate(context, "button.clickMe")))
            ],
          ),
        );
      }),
    );
  }
}