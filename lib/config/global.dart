import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static AppDataModel appDataModel;

// 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("appDataModel");
    if (_profile != null) {
      try {
//        appDataModel = AppDataModel.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
  }

  // 持久化Profile信息
//  static saveAppDataModel() =>
//      _prefs.setString("appDataModel", jsonEncode(appDataModel.toJson()));
}

class AppInfoChangeNotifier extends ChangeNotifier {
  AppDataModel get appDataModel => Global.appDataModel;

  @override
  void notifyListeners() {
//    Global.saveAppDataModel(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class AppDataModel extends Object {
  String shopId;
  String cityId;
  String token;

  AppDataModel({this.shopId, this.cityId});

  Map<String, dynamic> toJson(AppDataModel instance) => <String, dynamic>{
        'token': instance.token,
        'message': instance.cityId,
      };

  AppDataModel.fromJson(Map<String, dynamic> json) {
    shopId = json['shopId'];
    token = json['token'];
  }
}
