import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_geetest_plugin/flutter_geetest_plugin.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/constant/app_constant.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/config/config.dart';
import 'package:rok/page/common/webview_page.dart';
import 'package:rok/page/user/register_page.dart';

import '../../test/test_page.dart';

class LoginPage extends StatefulWidget {
  static final String sName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();
  final TextEditingController codeController = new TextEditingController();
  String _challenge = "";
  String _getPhoneCode = "获取验证码";
  bool _isClickCode = false;
  bool _isClickLogin = false;

// 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    getMobile();
  }

  getMobile() async {
    // String mobile = await LocalStorage.get(AppConstant.USER_MOBILE);
    userController.value = TextEditingValue(text: "18758586900");
    pwController.value = TextEditingValue(text: "123456");

    _setBtnState();
  }

  void _setBtnState() {
    _isClickCode = userController.text.length == 11;
    _isClickLogin =
        userController.text.length == 11 && pwController.text.length == 6;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: FlutterEasyLoading(
        child: Scaffold(
            body: GestureDetector(
                onTap: () {
                  // 点击空白页面关闭键盘
                  FocusScope.of(context).requestFocus(blankNode);
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: ScreenUtil.screenHeightDp,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 50, top: 88),
                              width: 153,
                              child: Image.asset(
                                  Config.KEY_IMAGE_PATH + "niu.png")),
                          _loginView(),
                          _loginBtn(),
                          _goCheckBtn(),
                          Expanded(
                            child: Container(),
                            flex: 1,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            radius: 0.0,
                            onTap: () {
                              if (Config.DEBUG) {
                                NavigatorUtils.navigatorRouter(
                                    context, TestPage());
                              }
                            },
                            child: Text(
                              "轻触上面的“登录”按钮，即表示你同意",
                              style: TextStyle(
                                  color: kAppSubTextColor, fontSize: 12),
                            ),
                          ),
                          _getUserAgreement(),
                        ]),
                  ),
                ))),
      ),
    );
  }

  Widget _loginView() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: <Widget>[
          TextField(
            controller: userController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              hintText: '请输入手机号18758586900',//（18758586900）
              hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
              border: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
              WhitelistingTextInputFormatter.digitsOnly
            ],
            onChanged: (v) {
              _setBtnState();
            },
            style: TextStyle(fontSize: 15, color: kAppTextColor),
            textAlign: TextAlign.left,
          ),
          Container(
            color: kAppColor("#E7E7E7"),
            height: 0.5,
          ),
          TextField(
            controller: pwController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              hintText: '请输入密码',
              hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
              border: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              WhitelistingTextInputFormatter.digitsOnly
            ],
            obscureText: true,
            onChanged: (v) {
              _setBtnState();
            },
            style: TextStyle(fontSize: 15, color: kAppTextColor),
            textAlign: TextAlign.left,
          ),
          Container(
            color: kAppColor("#E7E7E7"),
            height: 0.5,
          ),



          Row(
            children: <Widget>[
              Expanded(child: Container(),flex: 1,),
              Container(
                margin: EdgeInsets.only(right: 10,top: 10),
                  child: Text(
                "忘记密码?",
                style: TextStyle(
                  color: kAppThemeColor,
                  fontSize: fontSizeSmall,
                ),
              )),
            ],
          )
        ]));
  }

  Widget _loginBtn() {
    return InkWell(
      highlightColor: Colors.transparent,
      radius: 0.0,
      child: Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          height: 46,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isClickLogin ? kAppThemeColor : Color(0x75A14EFF),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "登 录",
            style: TextStyle(color: Colors.white, fontSize: kAppFontSize(28)),
          )),
      onTap: _login,
    );
  }

  Widget _goCheckBtn() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: 46,
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "没有账号？ ",
            style: TextStyle(color: kAppSubTextColor, fontSize: 14),
          ),
          InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Text(
                "马上注册",
                style: TextStyle(color: kAppThemeColor, fontSize: 14),
              ),
              onTap: () {

                NavigatorUtils.navigatorRouter(context, RegisterPage());
              }),

        ],
      ),
    );
  }

  Widget _getUserAgreement() {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Text(
                "服务协议",
                style: TextStyle(color: kAppThemeColor, fontSize: 12),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(blankNode);
                NavigatorUtils.navigatorRouter(
                    context,
                    WebViewPage(
                        url: AppConstant.H5_HEAD + "fwxy.html", title: "服务协议"));
              },
            ),
            Text(
              "和",
              style: TextStyle(color: kAppTextColor, fontSize: 12),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Text(
                "用户协议",
                style: TextStyle(color: kAppThemeColor, fontSize: 12),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(blankNode);
                NavigatorUtils.navigatorRouter(
                    context,
                    WebViewPage(
                        url: AppConstant.H5_HEAD + "yhxy.html", title: "用户协议"));
              },
            ),
          ],
        ));
  }

  Future<void> getSendVerifyCode() async {
    // String result;
    // try {
    //   result = await FlutterGeetestPlugin.getGeetest(_challenge);
    // } on Exception {}
    // if (!mounted && result.isEmpty) return;
    // Map<String, dynamic> map = convert.jsonDecode(result);
    // LocalStorage.save(AppConstant.BEHAVIOR_CHALLENGE, map["geetest_challenge"]);
    // LocalStorage.save(AppConstant.BEHAVIOR_VALIDATE, map["geetest_validate"]);
    // LocalStorage.save(AppConstant.BEHAVIOR_SEC_CODE, map["geetest_seccode"]);

//    var model = await YpGatewayDao.getSendVerifyCode(userController.text);
//    if (model.success) {
//      NavigatorUtils.showToast("发送验证码成功!");
//    }
  }

  Future getPreProcess() async {
    if (userController.text.length != 11) {
      NavigatorUtils.showToast("手机号码格式不对");
      return;
    }
    if (_countdownNum < 59) {
      return;
    }
    reGetCountdown();
//    var result = await YpGatewayDao.getPreProcess();
//    if (result.success) {
//      _challenge = json.encode(result.data);
//      getSendVerifyCode();
//    }
  }

  Timer _countdownTimer;
  int _countdownNum = 59;

  void reGetCountdown() {
    if (_countdownTimer != null) {
      return;
    }
    // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
    _getPhoneCode = '重新获取(${_countdownNum}s)';
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownNum > 0) {
          _countdownNum = _countdownNum - 1;
          _getPhoneCode = '重新获取(${_countdownNum}s)';
        } else {
          _getPhoneCode = '获取验证码';
          _countdownNum = 59;
          _countdownTimer.cancel();
          _countdownTimer = null;
        }
      });
    });
  }

  void _login() async {

    if(userController.text.length!=11){
      Fluttertoast.showToast(msg: "手机号格式不对");
      return;
    }

    if(pwController.text.length!=6){
      Fluttertoast.showToast(msg: "密码错误");
      return;
    }



    LocalStorage.save(AppConstant.USER_TOKEN, await reqUserLogin(userController.text,pwController.text));
    LocalStorage.save(AppConstant.USER_MOBILE, await userController.text);
    String taken = await LocalStorage.get(AppConstant.USER_TOKEN);
  if(null!= taken&& taken.length>0){
    NavigatorUtils.goHome(context);
  }
    return;

  }


  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
}
