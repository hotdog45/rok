// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_records_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationRecordsModel _$OperationRecordsModelFromJson(
    Map<String, dynamic> json) {
  return OperationRecordsModel(
    (json['last5'] as List)
        ?.map((e) => e == null
            ? null
            : OperationRecords.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['top5'] as List)
        ?.map((e) => e == null
            ? null
            : OperationRecords.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OperationRecordsModelToJson(
        OperationRecordsModel instance) =>
    <String, dynamic>{
      'last5': instance.last5,
      'top5': instance.top5,
    };

OperationRecords _$OperationRecordsFromJson(Map<String, dynamic> json) {
  return OperationRecords(
    (json['amount'] as num)?.toDouble(),
    (json['chg'] as num)?.toDouble(),
    (json['close'] as num)?.toDouble(),
    json['contractName'] as String,
    json['count'] as int,
    (json['high'] as num)?.toDouble(),
    json['id'] as int,
    (json['low'] as num)?.toDouble(),
    (json['open'] as num)?.toDouble(),
    json['ts'] as int,
    (json['vol'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OperationRecordsToJson(OperationRecords instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'chg': instance.chg,
      'close': instance.close,
      'contractName': instance.contractName,
      'count': instance.count,
      'high': instance.high,
      'id': instance.id,
      'low': instance.low,
      'open': instance.open,
      'ts': instance.ts,
      'vol': instance.vol,
    };
