// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_market_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowMarketModel _$NowMarketModelFromJson(Map<String, dynamic> json) {
  return NowMarketModel(
    json['id'] as int,
    (json['low'] as num)?.toDouble(),
    (json['high'] as num)?.toDouble(),
    (json['open'] as num)?.toDouble(),
    (json['close'] as num)?.toDouble(),
    (json['vol'] as num)?.toDouble(),
    (json['amount'] as num)?.toDouble(),
    json['version'] as int,
    json['count'] as int,
  );
}

Map<String, dynamic> _$NowMarketModelToJson(NowMarketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'low': instance.low,
      'high': instance.high,
      'open': instance.open,
      'close': instance.close,
      'vol': instance.vol,
      'amount': instance.amount,
      'version': instance.version,
      'count': instance.count,
    };
