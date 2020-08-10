
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';

class InputItemWidget extends StatefulWidget {
  final String theme;
  final int type;
  final String rightAction ;

  const InputItemWidget({Key key, this.theme, this.type, this.rightAction}) : super(key: key);
  @override
  _InputItemWidgetState createState() => _InputItemWidgetState();
}

class _InputItemWidgetState extends State<InputItemWidget> {
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
                Expanded(
                  child: Text(
                    widget.theme,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: fontSizeSmall,
                      color: kAppSubTextColor,
                    ),
                  ),
                ),

                Text(
                  null== widget.rightAction?"":widget.rightAction+"   ",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: fontSizeSmall,
                    color: kAppTextColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Image.asset(
                    "static/images/right_arrow.png",
                    height: 15,
                    width: 15,
                  ),
                ),
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
