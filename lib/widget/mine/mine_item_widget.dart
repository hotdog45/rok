import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rok/common/style/style.dart';

class MineItemWidget extends StatefulWidget {
  final String theme;
  final int type;
  final String rightAction;
  final Color color ;

  const MineItemWidget({Key key, this.theme, this.type, this.rightAction, this.color})
      : super(key: key);

  @override
  _MineItemWidgetState createState() => _MineItemWidgetState();
}

class _MineItemWidgetState extends State<MineItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 10, right: 10),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: kAppWhiteColor,
        borderRadius: BorderRadius.circular(2),
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
                      fontSize: fontSizeSmall,
                      color: kAppTextColor,
                    ),
                  ),
                ),
                Text(
                  null == widget.rightAction ? "" : widget.rightAction + "   ",
                  style: TextStyle(
                    fontSize: fontSizeSmall,
                    color: widget.color!=null?widget.color:kAppSubTextColor ,
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
