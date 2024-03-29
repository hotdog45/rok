import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/model/mine/asset_detail_model.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/i18n_utils.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/page/withdrawal/assets_page.dart';
import 'package:rok/page/withdrawal/recharge_online_page.dart';
import 'package:rok/page/withdrawal/withdrawal_online_page.dart';

class AssetsWidget extends StatefulWidget {
  @override
  _AssetsWidgetState createState() => _AssetsWidgetState();
}


class _AssetsWidgetState extends State<AssetsWidget> {
  AssetDetailModel detailModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    totalAssetDetail();
  }

  @override
  Widget build(BuildContext context) {
    return
      detailModel !=null?
      Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: kAppWhiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              width: ScreenUtil.screenWidthDp,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "总资产折合 >",
                style:
                    TextStyle(fontSize: fontSizeSmall, color: kAppSubTextColor),
              ),
            ),
            onTap: () {
              NavigatorUtils.navigatorRouter(context, AssetsPage());
            },
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              width: ScreenUtil.screenWidthDp,
              child: Text(
                detailModel.btcAsset.toString() + "  BTC",
                style: TextStyle(
                    fontSize: fontSizeNormal,
                    color: kAppTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              NavigatorUtils.navigatorRouter(context, AssetsPage());
            },
          ),
          InkWell(
            child: Container(
              width: ScreenUtil.screenWidthDp,
              margin: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "≈ "+detailModel.totalAsset.toString(),
                style: TextStyle(fontSize: fontSizeMiddle, color: kAppTextColor),
              ),
            ),
            onTap: () {
              NavigatorUtils.navigatorRouter(context, AssetsPage());
            },
          ),
          Row(
            children: <Widget>[
              InkWell(
                child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Icon(
                      FlutterIcons.account_circle_outline_mco,
                      size: 20,
                    )),
                onTap: (){
                  NavigatorUtils.navigatorRouter(context, RechargeOnlinePage());
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.only(top: 20, left: 5),
                    padding: EdgeInsets.all(3),
                    child: Text(
                      //入金
                      I18nUtils.translate(context, "button.deposit"),

                      style: TextStyle(
                        fontSize: fontSizeMiddle,
                        color: kAppTextColor,
                      ),
                    )),
                onTap: () {
//                 NavigatorUtils.navigatorRouter(context, RechargePage());
                  NavigatorUtils.navigatorRouter(context, RechargeOnlinePage());

                },
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Icon(
                      FlutterIcons.account_circle_outline_mco,
                      size: 20,
                    )),
                onTap: (){
                  NavigatorUtils.navigatorRouter(context, WithdrawlOnlinePage());
                },
              ),
              InkWell(
                child: Container(

                    margin: EdgeInsets.only(top: 20, left: 5, right: 50),
                    padding: EdgeInsets.all(3),
                    child: Text(
                      //出金
                      I18nUtils.translate(context, "button.withdrawal"),
                      style: TextStyle(
                        fontSize: fontSizeMiddle,
                        color: kAppTextColor,
                      ),
                    )),
                onTap: () {
//                  NavigatorUtils.navigatorRouter(context, WithdrawalPage());
                  NavigatorUtils.navigatorRouter(context, WithdrawlOnlinePage());

                },
              ),
            ],
          )
        ],
      ),
    ):Container();
  }


//资产详情
  void totalAssetDetail() async {
   detailModel = await assetDetail() ;
   setState(() {

   });
  }

}
