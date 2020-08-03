import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class WithdrawalPage extends StatefulWidget {
  @override
  _WithdrawalPageState createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar("出金", actions: [
        MySuperWidget(text: "出金记录", onTap: () {}),
      ]).build(context),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
                color: kAppWhiteColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "实名认证",
                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "顺风",
                        style: TextStyle(fontSize: fontSizeMiddle),
                      )),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "转账到银行卡",
                        style: TextStyle(
//                                fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "马上绑定",
                        style: TextStyle(
                            color: kAppThemeColor,
//                                fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
                color: kAppWhiteColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "实时报价",
                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "1USDT≈¥6.94",
                        style: TextStyle(fontSize: fontSizeMiddle),
                      )),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "单笔手续费",
                        style: TextStyle(
//                                fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "3USTD/笔",
                        style: TextStyle(

//                                fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "最多可卖出",
                        style: TextStyle(
//                                fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "88888888.888USDT",
                        style: TextStyle(

//                                fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
                color: kAppWhiteColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "卖出USDT",
                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                ),
                _getTextFieldAndBtn(controller2, "请输入金额，不少于20.0,"),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Text(
                        "预计收款：0.00",
                        style: TextStyle(
                            color: kAppThemeColor, fontSize: fontSizeMiddle),
                      )),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                //出金
                "*单笔卖出限额20～7000USTD",
                style: TextStyle(
                  fontSize: fontSizeSmall,
                  color: kAppSubTextColor,
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                //出金
                "*实际到账金额以OTC订单显示金额为准",
                style: TextStyle(
                  fontSize: fontSizeSmall,
                  color: kAppSubTextColor,
                ),
              )),
        ],
      ),
    );
  }

  final controller2 = TextEditingController();

  _getTextFieldAndBtn(controller, hintText, {hasMargin = false, onChanged}) {
    return Container(
      height: 40,
      width: ScreenUtil.screenWidthDp,
      margin: EdgeInsets.only(bottom: hasMargin ? 14 : 0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            width: ScreenUtil.screenWidthDp - 58,
            decoration: BoxDecoration(
                border: Border.all(color: kAppSubTextColor, width: 0.5),
                borderRadius: BorderRadius.circular(2)),
            alignment: Alignment.center,
//            padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 236,
                  height: 30,

//                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    //最大行数
                    decoration: InputDecoration.collapsed(hintText: hintText),
                    style: TextStyle(
                        fontSize: fontSizeMiddle,
                        color: kAppTextColor,
                        fontWeight: FontWeight.bold),
                    //输入文本的样式
                    onChanged: onChanged,
                    onSubmitted: (text) {
                      //内容提交(按回车)的回调
                      print('submit $text');
                      Fluttertoast.showToast(msg: 'submit $text');
                    },
                    enabled: true, //是否禁用
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10,bottom: 5),
                    child: Text(
                  "全部卖出",
                  style: TextStyle(
                      color: kAppThemeColor, fontSize: fontSizeMiddle),
                ))
              ],
            ),
          ),
          Container(
            width: 3,
          ),
        ],
      ),
    );
  }
}
