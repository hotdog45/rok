// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

withdrawPreviewModel _$withdrawPreviewModelFromJson(Map<String, dynamic> json) {
  return withdrawPreviewModel(
    (json['availableBalance'] as num)?.toDouble(),
    json['fee'] as int,
    (json['maxAmount'] as num)?.toDouble(),
    json['maxTimes'] as int,
    (json['minAmount'] as num)?.toDouble(),
    json['status'] as int,
    json['symbol'] as String,
    json['times'] as int,
  );
}

Map<String, dynamic> _$withdrawPreviewModelToJson(
        withdrawPreviewModel instance) =>
    <String, dynamic>{
      'availableBalance': instance.availableBalance,
      'fee': instance.fee,
      'maxAmount': instance.maxAmount,
      'maxTimes': instance.maxTimes,
      'minAmount': instance.minAmount,
      'status': instance.status,
      'symbol': instance.symbol,
      'times': instance.times,
    };
