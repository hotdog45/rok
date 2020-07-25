import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_geetest_plugin/flutter_geetest_plugin.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/common/webview_page.dart';

import '../test_page.dart';


class LoginPage extends StatefulWidget {
  static final String sName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();
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
    String mobile = await LocalStorage.get(Config.USER_MOBILE);
    userController.value = TextEditingValue(text: mobile ?? "");

    _setBtnState();
  }

  void _setBtnState() {
    _isClickCode = userController.text.length == 11;
    _isClickLogin = userController.text.length == 11 && pwController.text.length == 6;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaleFactor: 1),
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
                                  Config.KEY_IMAGE_PATH + "yipibao_logo.png")),
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
                                NavigatorUtils.navigatorRouter(context, TestPage());

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
          Stack(
            children: <Widget>[
              TextField(
                controller: userController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  hintText: '请输入11位手机号',
                  hintStyle:TextStyle(color: Color(0xffc3c3c3)), //修改颜色
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (v){
                   _setBtnState();
                },
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, color: kAppTextColor),
              ),
              Positioned(
                  top: 15,
                  right: 0,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    child: Container(
                      width: 80,
                      child: Text(
                        _getPhoneCode,
                        textAlign:_countdownNum == 59 ? TextAlign.center :  TextAlign.right,
                        style: TextStyle(
                            fontSize: 12,
                            color: (_countdownNum == 59 && _isClickCode)
                                ? kAppThemeColor
                                : kAppColor("#c3c3c3")),
                      ),
                    ),
                    onTap: getPreProcess,
                  )),
              Positioned(
                  top: 12,
                  right: 88,
                  bottom: 12,
                  child: Container(
                    color: kAppColor("#E7E7E7"),
                    width: 0.5,
                  )),
              Positioned(
                  top: 0,
                  right: 90,
                  bottom: 0,
                  child: InkWell(
                    onTap: (){
                      userController.value = TextEditingValue(text:"");
                      _setBtnState();
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(56),
                      height: ScreenUtil().setWidth(56),
                      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                      child: Image.asset(
                          "static/images/icon_close.png"), //AssetImage('static/images/close_circle.png')
                    ),
                  ))
            ],
          ),
          Container(
            color: kAppColor("#E7E7E7"),
            height: 0.5,
          ),
          TextField(
            controller: pwController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              hintText: '请输入验证码登录',
              hintStyle:TextStyle(color: Color(0xffc3c3c3)), //修改颜色
              border: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              WhitelistingTextInputFormatter.digitsOnly
            ],
            onChanged: (v){
              _setBtnState();
            },
            style: TextStyle(fontSize: 15, color: kAppTextColor),
            textAlign: TextAlign.left,
          ),
          Container(
            color: kAppColor("#E7E7E7"),
            height: 0.5,
          ),
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
          InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Text(
                "谊批宝入驻申请 ",
                style: TextStyle(color: kAppTextColor, fontSize: 14),
              ),
              onTap: () {


              }),
          SizedBox(
            child: Image.asset(Config.KEY_IMAGE_PATH + "icon_right.png"),
            width: 13,
            height: 24,
          ),
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
                        url: Config.H5_HEAD + "fwxy.html", title: "服务协议"));
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
                        url: Config.H5_HEAD + "yhxy.html", title: "用户协议"));
              },
            ),
          ],
        ));
  }

  Future<void> getSendVerifyCode() async {
    String result;
    try {
      result = await FlutterGeetestPlugin.getGeetest(_challenge);
    } on Exception {}
    if (!mounted && result.isEmpty) return;
    Map<String, dynamic> map = convert.jsonDecode(result);
    LocalStorage.save(Config.BEHAVIOR_CHALLENGE, map["geetest_challenge"]);
    LocalStorage.save(Config.BEHAVIOR_VALIDATE, map["geetest_validate"]);
    LocalStorage.save(Config.BEHAVIOR_SEC_CODE, map["geetest_seccode"]);

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

//    reqUserRegister();
    NavigatorUtils.goHome(context);
    return;
    if (userController.text.length != 11) {
      NavigatorUtils.showToast("手机号码格式不对");
      return;
    }
    if (pwController.text.length == 0) {
      NavigatorUtils.showToast("请填写密码");
      return;
    }
    EasyLoading.show();

//    var result = await YpGatewayDao.getMobileLogin(
//        userController.text, pwController.text);
//    if (result.success && result.data.token.toString().isNotEmpty) {
//      LocalStorage.save(Config.USER_TOKEN, result.data.token);
//      LocalStorage.save(Config.USER_MOBILE, result.data.user.mobile);
//      LocalStorage.save(Config.USER_NICKNAME, result.data.user.nickName);
//      LocalStorage.save(Config.USER_AVATAR, result.data.user.avatar);
//      LocalStorage.remove(Config.BEHAVIOR_CHALLENGE);
//      LocalStorage.remove(Config.BEHAVIOR_VALIDATE);
//      LocalStorage.remove(Config.BEHAVIOR_SEC_CODE);
//    } else {
//
//      EasyLoading.dismiss();
//    }
  }


  Future _getPersonalData() async {
//    DataResult res = await YpGatewayDao.getloadPersonal();
//    if (res.success) {
//      NavigatorUtils.showToast("登录成功");
//    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
}
