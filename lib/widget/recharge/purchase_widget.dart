import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';

class PurchaseWidget extends StatefulWidget {
  @override
  _PurchaseWidgetState createState() => _PurchaseWidgetState();
}

class _PurchaseWidgetState extends State<PurchaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: kAppWhiteColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            width: ScreenUtil.screenWidthDp,
            child: Text(
              "购买USDT",
              style: TextStyle(
                color: kAppTextColor,
                fontSize: fontSizeMiddle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),



          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(children: <Widget>[

              MySuperWidget(
                height: 40,
                width: 50,
                text: "-10",
                bgColor: kKeyButton,
                hasBorder: true,
                borderColor: kAppTextColor,
              ),

             _getTextFieldAndBtn(controller, "数量" ),
              MySuperWidget(
                height: 40,
                width: 50,
                text: "+10",
                bgColor: kKeyButton,
                hasBorder: true,
                borderColor: kAppTextColor,
              ),


            ],),
          ),


          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            width: ScreenUtil.screenWidthDp,
            child: Text(
              "支付",
              style: TextStyle(
                color: kAppTextColor,
                fontSize: fontSizeMiddle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              MySuperWidget(
                margin: EdgeInsets.only(left: 10),
                hasBorder: true,
                borderColor: kAppTextColor,
                text: "1000",
                padding:
                    EdgeInsets.only(left: 10, right:10, top: 8, bottom: 8),
                radius: 4,
              ),
              MySuperWidget(
                margin: EdgeInsets.only(left: 10),
                hasBorder: true,
                borderColor: kAppTextColor,
                text: "2000",
                padding:
                EdgeInsets.only(left: 10, right:10, top: 8, bottom: 8),
                radius: 4,
              ),
              MySuperWidget(
                margin: EdgeInsets.only(left: 10),
                hasBorder: true,
                borderColor: kAppTextColor,
                text: "5000",
                padding:
                EdgeInsets.only(left: 10, right:10, top: 8, bottom: 8),
                radius: 4,
              ),    MySuperWidget(
                margin: EdgeInsets.only(left: 10),
                hasBorder: true,
                borderColor: kAppTextColor,
                text: "10000",
                padding:
                EdgeInsets.only(left: 10, right:10, top: 8, bottom: 8),
                radius: 4,
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10,top: 20),
            child: Row(children: <Widget>[

              MySuperWidget(
                height: 40,
                width: 50,
                text: "-100",
                bgColor: kKeyButton,
                hasBorder: true,
                borderColor: kAppTextColor,
              ),

              _getTextFieldAndBtn(controller1, "金额" ),
              MySuperWidget(
                height: 40,
                width: 50,
                text: "+100",
                bgColor: kKeyButton,
                hasBorder: true,
                borderColor: kAppTextColor,
              ),


            ],),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            width: ScreenUtil.screenWidthDp,
            child: Text(
              "*输入金额为预估金额，请按照实际生成订单中的金额支付",
              style: TextStyle(
                color: kAppPriceColor,
                fontSize: fontSizeMin,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }


  final controller = TextEditingController();
  final controller1 = TextEditingController();

  _getTextFieldAndBtn(controller, hintText,
      {hasMargin = false, onChanged}) {
    return Container(

      height: 40,
      width: 200,
      margin: EdgeInsets.only(bottom: hasMargin ? 14 : 0),
      child: Row(
        children: <Widget>[
          Container(

            width:  197,
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
                  width: 196,
                  height: 30,

//                  margin: EdgeInsets.only(bottom: 10),
                 padding: EdgeInsets.only(bottom: 10,left: 10),
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
