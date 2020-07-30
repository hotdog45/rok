import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/recharge/recharging_deal_widget.dart';

class RechargePage extends StatefulWidget {
  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar("title.recharge", actions: [
        MySuperWidget(text: "充值记录", onTap: () {}),
      ]).build(context),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "实时报价",
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
                          "当前最优价格: ¥6.98/USDT",
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
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "实名认证",
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
                          "顺风",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                    ],
                  ),
                ),
                MySuperWidget(
                  text: "支付购买",
                  radius: 8,
                  bgColor: kAppThemeColor,
                  width: ScreenUtil.screenWidthDp,
                  height: 50,
                  textColor: kAppWhiteColor,
                  fontSize: fontSizeMiddle,
                  fontWeight: FontWeight.bold,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                ),

              Container(
                width: ScreenUtil.screenWidthDp,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("重要提示：\n*最小订单进入额20USDT\n*最大转入金额7000USTD\n*如金每天只能五次\n*到账时间10-30分钟，可24小时入金\n*付款账户必需为实名认证人开户\n*OTC服务由独立第三方平台提供"
                  ),
                ),
              ),
                RechargingDealWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
