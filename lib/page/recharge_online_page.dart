import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/common/yp_cached_network_Image.dart';

import 'bill_detail_list_page.dart';

class RechargeOnlinePage extends StatefulWidget {
  @override
  _RechargeOnlinePageState createState() => _RechargeOnlinePageState();
}

class _RechargeOnlinePageState extends State<RechargeOnlinePage> {
  String walletAdd = "";
  String walletAddss = "";
  @override
  void initState() {
    super.initState();
    _getWalletAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar("链上交易入金", actions: [
        MySuperWidget(text: "资金记录", onTap: () {
          Fluttertoast.showToast(msg: "1111");

          NavigatorUtils.navigatorRouter(context, BillDetailListPage());

        }),
      ]).build(context),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "充值币种", //"选择充值币种"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
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
                          "USDT", //"USTD >"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "链名", //"选择充值币种"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
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
                          "ERC20-USDT", //"USTD >"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(

                          margin: EdgeInsets.only(top: 1),
                          padding:
                          EdgeInsets.only(bottom: 15, right: 10, left: 15, top: 10),
                          child: YPCachedNetworkImage(
//                            placeholder: YPICons.DEFAULT_USER_ICON,
                            image: walletAddss,
                            width: 80,
                            height: 80,
                          ),
                          width: 95,
                          height: 95,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 20, top: 0),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                child: walletAdd.length > 1
                                    ? Text(
                                        walletAdd,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: fontSizeMiddle),
                                      )
                                    : Container(),
                                decoration: BoxDecoration(
                                    color: kShadowColor,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 5, bottom: 5),
                                child: Text(
                                  "复制地址",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontSizeMiddle),
                                ),
                                decoration: BoxDecoration(
                                    color: kAppThemeColor,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                              onTap: (){
                                Fluttertoast.showToast(msg: "复制成功");
                                Clipboard.getData(
                                    Clipboard.kTextPlain);
                                Clipboard.setData(ClipboardData(
                                    text: walletAdd));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "重要提示",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kAppPriceColor,
                        fontSize: fontSizeMiddle),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 请不要向上述地址入金任何非USDT资产，否则将不可找回",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 最低入金金额为1 USTD",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 你的USDT会在3-6个网络确认后到账",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _getWalletAddress() async {
    walletAdd = await walletAddress();
    setState(() {});
    _getWalletCodePic(walletAdd);
    return;
  }
  void _getWalletCodePic(String add) async {
    walletAddss = await walletAddressCodePic(add);
    setState(() {});
    return;
  }


}
