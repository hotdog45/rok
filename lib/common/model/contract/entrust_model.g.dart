// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrust_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrustModel _$EntrustModelFromJson(Map<String, dynamic> json) {
  return EntrustModel(
    json['contractCode'] as String,
    json['contractName'] as String,
    json['contractType'] as int,
    json['createTime'] as String,
    json['fee'] as double,
    json['feeRate'] as double,
    json['multiple'] as int,
    json['occurDate'] as int,
    json['price'] as double,
    json['quantity'] as int,
    json['serialNo'] as String,
    json['side'] as int,
    json['status'] as int,
    json['symbol'] as String,
    json['tradePrice'] as double,
    json['tradeQuantity'] as int,
    json['tradeTime'] as String,
    json['tradeType'] as int,
    json['type'] as int,
  );
}

Map<String, dynamic> _$EntrustModelToJson(EntrustModel instance) =>
    <String, dynamic>{
      'contractCode': instance.contractCode,
      'contractName': instance.contractName,
      'contractType': instance.contractType,
      'createTime': instance.createTime,
      'fee': instance.fee,
      'feeRate': instance.feeRate,
      'multiple': instance.multiple,
      'occurDate': instance.occurDate,
      'price': instance.price,
      'quantity': instance.quantity,
      'serialNo': instance.serialNo,
      'side': instance.side,
      'status': instance.status,
      'symbol': instance.symbol,
      'tradePrice': instance.tradePrice,
      'tradeQuantity': instance.tradeQuantity,
      'tradeTime': instance.tradeTime,
      'tradeType': instance.tradeType,
      'type': instance.type,
    };
