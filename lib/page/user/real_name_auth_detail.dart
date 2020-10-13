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
  final TextEditingController idController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar(
        "初级认证",
      ).build(context),
      body:    Container( width: ScreenUtil.screenWidthDp, child: Column(children: <Widget>[
        Container(
          width: ScreenUtil.screenWidthDp-42,
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Text(
            "请务必使用真实本人姓名及身份证号，一旦认证成功不可再次修改",
            maxLines: 3,
            style: TextStyle(
              fontSize: fontSizeMiddle,
              color: kAppSubTextColor,
            ),
          ),
        ),


        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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


                    Container(
                      width: 100,
                      child: TextField(
                        controller: nameController,
                        maxLines: 1,
                        //最大行数
                        decoration: InputDecoration.collapsed(hintText: "请输入姓名"),
                        style: TextStyle(
                            fontSize: fontSizeMiddle,
                            color: kAppTextColor,
                            fontWeight: FontWeight.bold),
                        //输入文本的样式
//                      onChanged: onChanged,
                        onSubmitted: (text) {
                          //内容提交(按回车)的回调
//                        print('submit $text');
//                        Fluttertoast.showToast(msg: 'submit $text');
                        },
                        enabled: true, //是否禁用
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
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                        "身份证号",
                        style: TextStyle(
                          fontSize: fontSizeSmall,
                          color: kAppTextColor,
                        ),
                      ),
                    ),


                    Container(
                      width: 100,
                      child: TextField(
                        controller: idController,
                        maxLines: 1,
                        //最大行数
                        decoration: InputDecoration.collapsed(hintText: "请输入证件号"),
                        style: TextStyle(
                            fontSize: fontSizeMiddle,
                            color: kAppTextColor,
                            fontWeight: FontWeight.bold),
                        //输入文本的样式
//                      onChanged: onChanged,
                        onSubmitted: (text) {
                          //内容提交(按回车)的回调
//                        print('submit $text');
//                        Fluttertoast.showToast(msg: 'submit $text');
                        },
                        enabled: true, //是否禁用
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
        ),
        InkWell(
          highlightColor: Colors.transparent,
          radius: 0.0,
          child: Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 46,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
//                color: _isClickLogin ? kAppThemeColor : Color(0x75A14EFF),
                color:   kAppThemeColor  ,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "提 交",
                style: TextStyle(color: Colors.white, fontSize: kAppFontSize(28)),
              )),
          onTap: (){


          },
        )
      ],),),
    );
  }
}
