import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';

class BondAndFeeWidget extends StatefulWidget {
  @override
  _BondAndFeeWidgetState createState() => _BondAndFeeWidgetState();
}

class _BondAndFeeWidgetState extends State<BondAndFeeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      padding: EdgeInsets.only(top: 12,bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),


     child: Row(
     children: <Widget>[
       Container(
         margin: EdgeInsets.only(left: 10, top: 5),
         child: Center(
           child: Text(
             "持仓占用保证金",
             style:
             TextStyle(fontSize: fontSizeNormal, color: kAppTextColor, fontWeight: FontWeight.bold),
           ),
         ),
       ),
       Expanded(child: Container(),),

       Column(children: <Widget>[
         Container(
           margin: EdgeInsets.only(left: 20, top: 5),
           width: (ScreenUtil.screenWidthDp - 90) / 2,
           child: Text(
             "88888888.000000",
             style:
             TextStyle(fontSize: fontSizeMiddle, color: kAppTextColor,fontWeight: FontWeight.bold),
           ),
         ),
         Container(
           width: (ScreenUtil.screenWidthDp - 90) / 2,
           margin: EdgeInsets.only(left: 20, top: 5),
           child: Text(
             "≈0.00000000(CYN)",
             style:
             TextStyle(fontSize: fontSizeMin, color: kAppTextColor),
           ),
         )
       ],)

     ],
     ),
    );
  }
}
