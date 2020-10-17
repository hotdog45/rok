import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/model/mine/asset_record_list_model.dart';
import 'package:rok/common/style/style.dart';

class BillItemWidget extends StatefulWidget {
  final AssetList assetList;

  const BillItemWidget({Key key, this.assetList}) : super(key: key);

  @override
  _BillItemWidgetState createState() => _BillItemWidgetState();
}

class _BillItemWidgetState extends State<BillItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: kAppWhiteColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              width: ScreenUtil.screenWidthDp,
              child: Text(
                widget.assetList.remark,
//                "开仓10000手BTC/USDT 冻结保证金",
                style: TextStyle(
                  fontSize: fontSizeMiddle,
                  color: kAppTextColor,
                ),
              )),



          Row(children: <Widget>[

            Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    "数量",
                    style: TextStyle(color:kAppSubTextColor, fontSize: fontSizeSmall),
                  )),

              Container(
       
                  margin: EdgeInsets.only(left: 10,  bottom: 10),
                  child: Text(
                    widget.assetList.type == 1
                        ? "+"+ widget.assetList.quantity.toString()
                        : "-" + widget.assetList.quantity.toString(),

                    style: TextStyle(color:  widget.assetList.type == 1?kGreenColor:kAppPriceColor, fontSize: fontSizeMiddle),
                  )),
            ],),


            Expanded(
              child: Column(children: <Widget>[

                Container(
                    width: 120,

                    margin: EdgeInsets.only(top:10,bottom: 5, left: 10),
                    child: Text(
                      "时间",
                      style: TextStyle(
                          color: kAppSubTextColor, fontSize: fontSizeSmall),
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10, right: 10),
                    child: Text(
                      widget.assetList.createTime,
                      style: TextStyle(
                          color: kAppSubTextColor, fontSize: fontSizeSmall),
                    ))
              ],),
            )

          ],),




        ],
      ),
    );
  }
}
