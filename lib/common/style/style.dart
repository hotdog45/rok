import 'dart:math';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

//主题色
Color kAppThemeColor = Color(0xFFa14EFF);
//透明
Color kAppClearColor = Color(0x00ffffff);
//背景色
Color kAppBcgColor = Color(0xFFF8F8F8);
//价格
Color kAppPriceColor = Color(0xFFff4400);
//一级文字
Color kAppTextColor = Color(0xFF474245);
//二级文字
Color kAppSubTextColor = Color(0xFF969696);
//三级文字
Color kAppSub2TextColor = Color(0xFFaaaaaa);
//阴影
Color kShadowColor = Color(0xFFD5DBDB);
//白色
Color kAppWhiteColor = Color(0xFFFFFFFF);
//白色
Color kAppBlackColor = Color(0xFF000000);

//绿色
Color kGreenColor = Color(0xFF02BD99);
Color kGreenSubColor = Color(0xFFF1F8F8);
//红色
Color kRedColor = Color(0xFFD70C6A);

Color kRedSubColor = Color(0xFFFCF6F8);


Color kSubBtnColor = Color(0xFFEDF3FF);



//我的 背景色
Color kMineBgColor = Color(0xFFF4F9FF);

//我的 背景色2
Color kMineBgColor1 = Color(0xFFE7EEFE);

Color kKeyButton = Color(0xFFEFEBF9);


Color kAppColor(String hex) {
// 如果传入的十六进制颜色值不符合要求，返回默认值
  if (hex == null ||
      hex.length != 7 ||
      int.tryParse(hex.substring(1, 7), radix: 16) == null) {
    hex = '#ffffff';
  }
  return new Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

num kAppFontSize(num size) {
  return ScreenUtil().setWidth(size);
}

Color randomColor() {
  var random = new Random();
  int r = random.nextInt(255);
  int g = random.nextInt(255);
  int b = random.nextInt(255);
  return Color.fromARGB(255, r, g, b);
}

String defaultImage = 'static/images/yp_default_img.png';

/// 字体大小
double fontSizeMicro = 10.0;
double fontSizeMin = 12.0;
double fontSizeSmall = 14.0;
double fontSizeMiddle = 16.0;
double fontSizeNormal = 18.0;
double fontSizeBig = 22.0;
double fontSizeLager = 30.0;
