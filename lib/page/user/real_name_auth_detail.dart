import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';

class RealNameAuthDetail extends StatefulWidget {
  @override
  _RealNameAuthDetailState createState() => _RealNameAuthDetailState();
}

class _RealNameAuthDetailState extends State<RealNameAuthDetail> {
  final TextEditingController nameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "初级认证",
      ).build(context),
      body:    Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
        Container(
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
                     "姓名",
                      style: TextStyle(
                        fontSize: fontSizeSmall,
                        color: kAppTextColor,
                      ),
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: '请输入姓名',
                      hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
                      border: InputBorder.none,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
//                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onChanged: (v) {
//                      _setBtnState();
                    },
                    style: TextStyle(fontSize: 15, color: kAppTextColor),
                    textAlign: TextAlign.left,
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
      )
          ],
        ),
      ),
    );
  }
}
