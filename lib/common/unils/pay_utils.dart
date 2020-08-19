import 'dart:io';

import 'package:fluwx/fluwx.dart';

class PayUtils {
  static wxPay(partnerId, prepayId, packageValue, nonceStr, timeStamp, sign) {
    payWithWeChat(
            appId: Platform.isIOS ? "wxb68309ed6b51fa56" : "wxb68309ed6b51fa56",
            partnerId: partnerId,
            prepayId: prepayId,
            packageValue: packageValue,
            nonceStr: nonceStr,
            timeStamp: int.parse(timeStamp),
            sign: sign)
        .then((data) {
      print(data);
    });
  }
}
