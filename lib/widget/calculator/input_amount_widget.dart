import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';

class InputAmountWidget extends StatefulWidget {
  final theme;
  final unit;

  const InputAmountWidget({Key key, this.theme, this.unit}) : super(key: key);

  @override
  _InputAmountWidgetState createState() => _InputAmountWidgetState();
}

class _InputAmountWidgetState extends State<InputAmountWidget> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 10, right: 10),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: kAppWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 50,
      width: ScreenUtil.screenWidthDp,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    widget.theme,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: fontSizeSmall,
                      color: kAppSubTextColor,
                    ),
                  ),
                ),

                Container(
                  width: 250,
                  height: 40,
                  margin: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: controller1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: '请输入',
                      hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
                      border: InputBorder.none,
                    ),
                    inputFormatters: [
//                    LengthLimitingTextInputFormatter(11),
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onChanged: (v) {
                      //   _setBtnState();
                    },
                    style: TextStyle(fontSize: 15, color: kAppTextColor),
                    textAlign: TextAlign.right,
                  ),
                ),

                Text(
                  widget.unit,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: fontSizeSmall,
                    color: kAppTextColor,
                  ),
                ),
//                Container(
//                  padding: EdgeInsets.only(right: 15),
//                  child: Image.asset(
//                    "static/images/right_arrow.png",
//                    height: 15,
//                    width: 15,
//                  ),
//                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: ScreenUtil.screenWidthDp,
            color: kMineBgColor,
          )
        ],
      ),
    );
  }
}
