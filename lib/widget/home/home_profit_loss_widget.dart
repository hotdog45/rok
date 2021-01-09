import 'package:flutter/material.dart';
import 'package:rok/common/model/mine/asset_detail_model.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/withdrawal/recharge_online_page.dart';
import 'package:rok/page/withdrawal/withdrawal_online_page.dart';

class HomeProfitLossWidget extends StatefulWidget {
  final AssetDetailModel detailModel;

  const HomeProfitLossWidget({Key key, this.detailModel}) : super(key: key);

  @override
  _HomeProfitLossWidgetState createState() => _HomeProfitLossWidgetState();
}

class _HomeProfitLossWidgetState extends State<HomeProfitLossWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kAppColor("#85C1E9"), kAppColor("#2E86C1")],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getLineWidget(
                      "浮动盈亏", widget.detailModel?.profitLoss?.toString() ?? "0"),
                  _getLineWidget(
                      "占用保证金", widget.detailModel?.deposit?.toString() ?? "0"),
                  _getLineWidget("可用余额", widget.detailModel?.balance?.toString() ?? "0")
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  NavigatorUtils.navigatorRouter(context, RechargeOnlinePage());

                },
                child: Container(
                  height: 54,
                  width: 130,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [kAppColor("#85C1E9"), kAppColor("#2E86C1")],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "入金",
                    style: TextStyle(
                        fontSize: fontSizeNormal, color: kAppWhiteColor),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    NavigatorUtils.navigatorRouter(context, WithdrawlOnlinePage());

                  },
                  child: Container(
                    height: 54,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [kAppColor("#76448A"), kAppThemeColor],
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "出金",
                      style: TextStyle(
                          fontSize: fontSizeNormal, color: kAppWhiteColor),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  _getLineWidget(title, price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: fontSizeSmall, color: kAppWhiteColor),
        ),
        Text(
          price,
          style: TextStyle(fontSize: fontSizeSmall, color: kAppWhiteColor),
        ),
      ],
    );
  }
}
