import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';

class RealNameAuthDetail extends StatefulWidget {
  @override
  _RealNameAuthDetailState createState() => _RealNameAuthDetailState();
}

class _RealNameAuthDetailState extends State<RealNameAuthDetail> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController idController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "身份认证",
      ).build(context),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "请务必使用真实本人姓名及身份证号，一旦认证成功不可再次修改",
              maxLines: 3,
              style: TextStyle(
                fontSize: fontSizeMiddle,
                color: kAppSubTextColor,
              ),
            ),
          ),
          _getItemWidget("姓名", "请输入真实姓名", nameController, type: 1),
          _getItemWidget("身份证", "请输入身份证号码", idController),
          InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                height: 46,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kAppThemeColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "提 交",
                  style: TextStyle(
                      color: Colors.white, fontSize: kAppFontSize(28)),
                )),
            onTap: () {},
          )
        ],
      ),
    );
  }

  _getItemWidget(title, subTitle, TextEditingController controller,
      {type = 2}) {
    return MySuperWidget(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      bgColor: kAppWhiteColor,
      radius: 6,
      height: 55,
      width: ScreenUtil.screenWidthDp,
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: fontSizeNormal,
                color: kAppTextColor,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: 1,
              keyboardType:
                  type == 1 ? TextInputType.text : TextInputType.emailAddress,
              decoration: InputDecoration.collapsed(hintText: subTitle),
              style: TextStyle(
                fontSize: fontSizeNormal,
                color: kAppTextColor,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(type == 1 ? 8 : 18),
              ],
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
