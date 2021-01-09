import 'package:rok/common/model/contract/entrust_model.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/now_market_model.dart';
import 'package:rok/common/model/home/operation_records_model.dart';
import 'package:rok/common/model/mine/asset_detail_model.dart';
import 'package:rok/common/net/api.dart';

import 'address.dart';

//获取版本更新数据

reqUserLogin(String phone, /*String smsCode,*/ String password) async {
  return await httpManager.netFetch(userLogin, {
    "phone": phone,
    "password": password,
//    "smsCode": smsCode
  });
}

reqUserInfo() async {
  return await httpManager.netFetch(userCurrentInfo, {});
}

//资产详情
assetDetail() async {
  var json =  await httpManager.netFetch(userAssetDetail, {});
  return AssetDetailModel.fromJson(json);
}

reqHomeData() async {
  return await httpManager.netFetch(index, null);
}

//行情列表
Future<List<Contracts>> reqContractListData() async {
  var jsonStr =
      await httpManager.netFetch(contractList, null, useBaseModel: false);
  NowMarketBaseModel nowMarketBaseModel = NowMarketBaseModel.fromJson(jsonStr);

  return nowMarketBaseModel.data;
}

//钱包地址
walletAddress() async {
  return await httpManager.netFetch(ERC20USDTWalletAddress, {});
}

//
//提币申请预览
withdrawPreviews() async {
  return await httpManager.netFetch(withdrawPre, {});
}

//提币申请
applyWithdrawPreviews(String address, double quantity) async {
  return await httpManager.netFetch(withdrawApply, {
    "address": address,
    "quantity": quantity,
  });
}

//持仓列表
reqPositionList(String contractCode) async {
  return await httpManager
      .netFetch(positionList, {"contractCode": contractCode});
}

//委托列表
reqEntrustList(String contractCode, {List<int> typeList}) async {
  List jsonList = await httpManager.netFetch(
      entrustList, {"contractCode": contractCode, "typeList": typeList});

  List<EntrustModel> list = jsonList
      ?.map((e) =>  EntrustModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
  return list;
}

recordList(int bizType, int pageNo, int pageSize) async {
  return await httpManager.netFetch(recordListreq, {
    "bizType": bizType,
    "pageNo": pageNo,
    "pageSize": pageSize,
  });
}

///收益计算  closePrice: 平仓价   multiple： 倍数   contractCode：合约编码  openPrice:开仓价  side  1-开多 2-开空  quantity 开仓数量(张)
//

profitCalculat(int closePrice, String contractCode, int multiple, int openPrice,
    int side, quantity) async {
  return await httpManager.netFetch(profitCalculation, {
    "closePrice": closePrice,
    "contractCode": contractCode,
    "multiple": multiple,
    "openPrice": openPrice,
    "side": side,
    "quantity": quantity,
  });
}

daoTradeOpen(String contractCode, int entrustType, int multiple, int price,
    int quantity, int side, int triggerPrice) async {
  return await httpManager.netFetch(tradeOpen, {
    "contractCode": contractCode,
    "entrustType": entrustType,
    "multiple": multiple,
    "price": price,
    "quantity": quantity,
    "side": side,
    "triggerPrice": triggerPrice,
  });
}
//
