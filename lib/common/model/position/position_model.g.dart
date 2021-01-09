// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) {
  return PositionModel(
    json['balance'] as int,
    json['contactCode'] as String,
    json['contactName'] as String,
    json['contractType'] as int,
    (json['deposit'] as num)?.toDouble(),
    json['frozenBalance'] as int,
    json['id'] as int,
    (json['lossPrice'] as num)?.toDouble(),
    (json['maxSubDeposit'] as num)?.toDouble(),
    json['multiple'] as int,
    (json['price'] as num)?.toDouble(),
    (json['profit'] as num)?.toDouble(),
    (json['profitRate'] as num)?.toDouble(),
    json['side'] as int,
    json['symbol'] as String,
    json['tradeQuantity'] as int,
    json['tradeTime'] as String,
  );
}

Map<String, dynamic> _$PositionModelToJson(PositionModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'contactCode': instance.contactCode,
      'contactName': instance.contactName,
      'contractType': instance.contractType,
      'deposit': instance.deposit,
      'frozenBalance': instance.frozenBalance,
      'id': instance.id,
      'lossPrice': instance.lossPrice,
      'maxSubDeposit': instance.maxSubDeposit,
      'multiple': instance.multiple,
      'price': instance.price,
      'profit': instance.profit,
      'profitRate': instance.profitRate,
      'side': instance.side,
      'symbol': instance.symbol,
      'tradeQuantity': instance.tradeQuantity,
      'tradeTime': instance.tradeTime,
    };
