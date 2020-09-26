import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/setting_page.dart';
import 'package:rok/page/user/login_page.dart';

class AccountWidget extends StatefulWidget {
  final String userName;

  const AccountWidget({Key key, this.userName}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          child: Container(
            margin: EdgeInsets.only(right: 10, top: 60, left: 20),
            child: Icon(
              FlutterIcons.account_circle_outline_mco,
              size: 50,
            ),
          ),
          onTap: () {
            NavigatorUtils.navigatorRouter(context, LoginPage());
          },
        ),
        InkWell(
            child: Column(
              children: <Widget>[
                Container(
                  width: 160,
                  margin: EdgeInsets.only(
                    top: 50,
                  ),
                  child: Text(
                    widget.userName,
//                    "请登录",
                    style: TextStyle(
                        fontSize: fontSizeMiddle,
                        color: kAppTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 160,
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(
                    "欢迎来到TOC",
                    style:
                        TextStyle(fontSize: fontSizeMin, color: kAppTextColor),
                  ),
                ),
              ],
            ),
            onTap: () {
              if( widget.userName=="请登录"){
                NavigatorUtils.navigatorRouter(context, LoginPage());
              }


            }),
        Expanded(
          child: Container(),
          flex: 1,
        ),

        InkWell(child:  Container(
          margin: EdgeInsets.only(right: 30, top: 30, left: 20),
          child: Icon(
            FlutterIcons.setting_ant,
            size: 20,
          ),


        ),onTap: (){
          NavigatorUtils.navigatorRouter(context, SettingPage());
        },) ,


      ],
    );
  }
}
