
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
//三级级文字
Color kAppSub2TextColor = Color(0xFFaaaaaa);

//阴影
Color kShadowColor = Color(0xFFD5DBDB);
//品牌页面标记
Color kAppBrandBgColor = Color(0xfff5b90b);
//白色
Color kAppWhiteColor = Color(0xFFFFFFFF);


//绿色
Color kGreenColor = Color(0xFF2ECC71);
Color kSubGreenColor = Color(0xFF5F5E3);

//支付
Color kAppPayColor = Color(0xFF777777);
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
  print(r);
  print(g);
  print(b);
  return Color.fromARGB(255, r, g, b);
}

String defaultImage = 'static/images/yp_default_img.png';

double fontSize8 = 8;
double fontSize10 = 10;
double fontSize12 = 12;
double fontSize14 = 14;
double fontSize16 = 16;
double fontSize18 = 18;
double fontSize20 = 20;
double fontSize30 = 30;







class YPICons {
  static const String DEFAULT_USER_ICON = 'static/images/yp_default_img.png';
}

