import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rok/common/constant/app_constant.dart';
import 'package:rok/common/model/mine/user_info.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/user/login_page.dart';
import 'package:rok/page/user/real_name_auth_detail.dart';
import 'package:rok/widget/common/my_super_widget.dart';

class AccountWidget extends StatefulWidget {
  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  userInfo userInformation;
  String userName;
  @override
  void initState() {
    super.initState();
    reqUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    return MySuperWidget(
      onTap: () async {
        String token = await LocalStorage.get(AppConstant.USER_TOKEN) ?? "";
        if (token.isEmpty) {
          NavigatorUtils.navigatorRouter(context, LoginPage());
        }
      },
      padding: EdgeInsets.only(top: 60),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              FlutterIcons.h_square_faw,
              size: 70,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  userName,
                  style: TextStyle(
                      fontSize: fontSizeMiddle,
                      color: kAppTextColor,
                      fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(bottom: 6),
              ),
              MySuperWidget(
                onTap: () {
                  if (userInformation.verifyStatus != 2) {
                    // NavigatorUtils.navigatorRouter(context, RealNameAuth());
                    NavigatorUtils.navigatorRouter(
                        context, RealNameAuthDetail());
                  }
                },
                bgColor: kAppBrandBgColor,
                radius: 20,
                padding: EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
                child: Text(
                  userInformation?.verifyStatus != 2 ? "实名认证" : "已实名认证",
                  style: TextStyle(fontSize: fontSizeMin, color: kAppTextColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //资产详情
  void reqUserInformation() async {
    var data = await reqUserInfo();
    userInformation = userInfo.fromJson(data);
    String token = await LocalStorage.get(AppConstant.USER_TOKEN) ?? "";
    if(token.isNotEmpty){
      userName = await LocalStorage.get(AppConstant.USER_MOBILE);
      userName = userName.substring(0,4)+"****"+ userName.substring(8,11);
      setState(() {
      });
    }else{
      userName = "请登录";
    }

    setState(() {});
  }
}
