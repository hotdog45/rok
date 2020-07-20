import 'dart:collection';


import 'package:rok/common/model/home/app_upgrade.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/api.dart';

import 'dao_result.dart';

final HttpManager httpManager = new HttpManager();

class YpGatewayDao {
  //获取版本更新数据
  static getCheckAppUpgrade() async {
    var resp =
        await httpManager.netFetchGateway(Address.getCheckAppUpgrade, {});
    var result = httpManager.resultGateway2(resp);
    if (result == null) {
      return DataResult(null, false);
    }
    AppUpgrade model = AppUpgrade.fromJson(result);
    return DataResult(model, true);
  }




}
