import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/api.dart';


//获取版本更新数据
reqUserRegister() async {
  return await httpManager.netFetch(getUserRegister, {
    "channelNo": "iii",
    "password": "1222222222222",
    "phone": "15829554591",
    "smsCode": "2222"
  });
}
