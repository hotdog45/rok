// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_record_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetRecordListModel _$AssetRecordListModelFromJson(Map<String, dynamic> json) {
  return AssetRecordListModel(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : AssetList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['pageNo'] as int,
    json['pageSize'] as int,
    json['total'] as int,
    json['totalPage'] as int,
  );
}

Map<String, dynamic> _$AssetRecordListModelToJson(
        AssetRecordListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'total': instance.total,
      'totalPage': instance.totalPage,
    };

AssetList _$AssetListFromJson(Map<String, dynamic> json) {
  return AssetList(
    json['bizType'] as int,
    json['createTime'] as String,
    json['id'] as int,
    json['occurDate'] as int,
    (json['quantity'] as num)?.toDouble(),
    json['remark'] as String,
    json['serialNo'] as String,
    json['symbol'] as String,
    json['type'] as int,
    json['userId'] as int,
  );
}

Map<String, dynamic> _$AssetListToJson(AssetList instance) => <String, dynamic>{
      'bizType': instance.bizType,
      'createTime': instance.createTime,
      'id': instance.id,
      'occurDate': instance.occurDate,
      'quantity': instance.quantity,
      'remark': instance.remark,
      'serialNo': instance.serialNo,
      'symbol': instance.symbol,
      'type': instance.type,
      'userId': instance.userId,
    };
