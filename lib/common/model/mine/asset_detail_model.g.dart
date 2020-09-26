// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

assetDetailModel _$assetDetailModelFromJson(Map<String, dynamic> json) {
  return assetDetailModel(
    (json['balance'] as num)?.toDouble(),
    (json['btcAsset'] as num)?.toDouble(),
    (json['deposit'] as num)?.toDouble(),
    (json['profitLoss'] as num)?.toDouble(),
    (json['totalAsset'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$assetDetailModelToJson(assetDetailModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'btcAsset': instance.btcAsset,
      'deposit': instance.deposit,
      'profitLoss': instance.profitLoss,
      'totalAsset': instance.totalAsset,
    };
