import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';

class InputSwitchWidget extends StatefulWidget {
  final String theme;
  final int type;
  const InputSwitchWidget({Key key, this.theme, this.type}) : super(key: key);

  @override
  _InputSwitchWidgetState createState() => _InputSwitchWidgetState();
}

class _InputSwitchWidgetState extends State<InputSwitchWidget> {
  bool check = false;
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
                Container(
                  color: kAppWhiteColor,
                  width: 50,
                  child: Switch(
                      value: check,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.check = !this.check;
                        });
                      }),
                )
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

//  Switch 有以下常用属性：
//
//  activeColor → Color - 激活时原点的颜色。
//  activeThumbImage → ImageProvider - 原点还支持图片，激活时的效果。
//  activeTrackColor → Color - 激活时横条的颜色。
//  inactiveThumbColor → Color - 非激活时原点的颜色。
//  inactiveThumbImage → ImageProvider - 非激活原点的图片效果。
//  inactiveTrackColor → Color - 非激活时横条的颜色。
//  onChanged → ValueChanged - 改变时触发。
//  value → bool - 切换按钮的值。

}
