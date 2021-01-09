import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/common/constant/app_constant.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "设置",
      ).build(context),
      body: Column(
        children: <Widget>[
          InkWell(
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                height: 46,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kAppThemeColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "退出当前账户",
                  style: TextStyle(
                      color: Colors.white, fontSize: kAppFontSize(28)),
                )),
            onTap: () {
              LocalStorage.remove(AppConstant.USER_TOKEN);
              LocalStorage.remove(AppConstant.USER_MOBILE);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
