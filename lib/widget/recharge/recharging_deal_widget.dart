import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';

class RechargingDealWidget extends StatefulWidget {
  @override
  _RechargingDealWidgetState createState() => _RechargingDealWidgetState();
}

class _RechargingDealWidgetState extends State<RechargingDealWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: ScreenUtil.screenWidthDp,
      decoration: BoxDecoration(
          color: kAppWhiteColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "交易中订单",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeMiddle,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "订单将在14分28秒后失效",
                style: TextStyle(
                  color: kAppSubTextColor,
                  fontSize: fontSizeSmall,
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "请尽快汇款并确认已付款操作",
                style: TextStyle(
                  color: kAppSubTextColor,
                  fontSize: fontSizeSmall,
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "购买数量：6800",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "支付金额：42800",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "时间：2020-10-02 20：06：23",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "状态：交易中",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "支付方式 网银支付",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "收款账号：66083352346453456",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "收款人：朱令",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "附言：364021",
                style: TextStyle(
                    color: kAppTextColor,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
              )),
          Row(
            children: <Widget>[
              MySuperWidget(
                text: "取消订单",
                radius: 8,
                bgColor: kAppWhiteColor,
                width: ScreenUtil.screenWidthDp / 3,
                height: 40,
                textColor: kAppThemeColor,
                borderColor: kAppThemeColor,
                hasBorder: true,
                fontSize: fontSizeMiddle,
                fontWeight: FontWeight.bold,
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
              ),
              MySuperWidget(
                text: "确认已付款",
                radius: 8,
                bgColor: kAppThemeColor,
                width: ScreenUtil.screenWidthDp / 3,
                height: 40,
                textColor: kAppWhiteColor,
                fontSize: fontSizeMiddle,
                fontWeight: FontWeight.bold,
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
              ),
            ],
          )
        ],
      ),
    );
  }
}
