import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/api.dart';


//获取版本更新数据


reqUserLogin(String phone, /*String smsCode,*/String password) async {
  return await httpManager.netFetch(userLogin, {

    "phone": phone,
    "password": password,
//    "smsCode": smsCode

  });
}
