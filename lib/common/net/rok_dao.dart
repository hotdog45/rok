import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/api.dart';
import 'package:rok/common/unils/local_storage.dart';


//获取版本更新数据


reqUserLogin(String phone, /*String smsCode,*/String password) async {
  return await httpManager.netFetch(userLogin, {

    "phone": phone,
    "password": password,
//    "smsCode": smsCode

  });
}

//userProfit

getAvailableBalance() async {
  String token = await LocalStorage.get(Config.USER_TOKEN) ?? "";

  Fluttertoast.showToast(msg: token+"ds");
  return await httpManager.netFetch(userProfit, {
    "token": token,
  });
}

