import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';

class BillItemWidget extends StatefulWidget {
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
              margin: EdgeInsets.only(left: 10,top: 10),
              width: ScreenUtil.screenWidthDp,
              child: Text(
                "开仓10000手BTC/USDT 冻结保证金",
                style: TextStyle(
                  fontSize: fontSizeMiddle,
                  color: kAppTextColor,
                ),
              )),

//

          Container(
              width: ScreenUtil.screenWidthDp,
              margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
              child: Text(
                "-18996589.54680000USDT",
                style: TextStyle(color: kGreenColor, fontSize: fontSizeMiddle),
              )),

          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                    child: Text(
                      "2023-08-01 23:41:59",
                      style: TextStyle(
                          color: kAppSubTextColor, fontSize: fontSizeSmall),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  child: Text(
                    "可用余额129875963.45937500USDT",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
