// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    json['appConfigs'] == null
        ? null
        : AppConfigs.fromJson(json['appConfigs'] as Map<String, dynamic>),
    (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['contracts'] as List)
        ?.map((e) =>
            e == null ? null : Contracts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['menus'] as List)
        ?.map(
            (e) => e == null ? null : Menus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['notices'] as List)
        ?.map((e) =>
            e == null ? null : Notices.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'appConfigs': instance.appConfigs,
      'banners': instance.banners,
      'contracts': instance.contracts,
      'menus': instance.menus,
      'notices': instance.notices,
    };

AppConfigs _$AppConfigsFromJson(Map<String, dynamic> json) {
  return AppConfigs(
    json['app_name'] as String,
  );
}

Map<String, dynamic> _$AppConfigsToJson(AppConfigs instance) =>
    <String, dynamic>{
      'app_name': instance.appName,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
    json['imgUrl'] as String,
    json['targetUrl'] as String,
    json['title'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'targetUrl': instance.targetUrl,
      'title': instance.title,
      'type': instance.type,
    };

Contracts _$ContractsFromJson(Map<String, dynamic> json) {
  return Contracts(
    json['code'] as String,
    (json['feeRate'] as num)?.toDouble(),
    json['icon'] as String,
    json['maxMultiple'] as int,
    json['maxQuantity'] as int,
    json['minQuantity'] as int,
    json['name'] as String,
    json['rate'] as int,
    json['remark'] as String,
    json['scale'] as int,
    json['status'] as int,
    json['symbol'] as String,
    json['topic'] as String,
    json['tradeStatus'] as int,
    json['type'] as int,
  );
}

Map<String, dynamic> _$ContractsToJson(Contracts instance) => <String, dynamic>{
      'code': instance.code,
      'feeRate': instance.feeRate,
      'icon': instance.icon,
      'maxMultiple': instance.maxMultiple,
      'maxQuantity': instance.maxQuantity,
      'minQuantity': instance.minQuantity,
      'name': instance.name,
      'rate': instance.rate,
      'remark': instance.remark,
      'scale': instance.scale,
      'status': instance.status,
      'symbol': instance.symbol,
      'topic': instance.topic,
      'tradeStatus': instance.tradeStatus,
      'type': instance.type,
    };

Menus _$MenusFromJson(Map<String, dynamic> json) {
  return Menus(
    json['icon'] as String,
    json['targetUrl'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$MenusToJson(Menus instance) => <String, dynamic>{
      'icon': instance.icon,
      'targetUrl': instance.targetUrl,
      'title': instance.title,
    };

Notices _$NoticesFromJson(Map<String, dynamic> json) {
  return Notices(
    json['content'] as String,
    json['createTime'] as String,
    json['id'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$NoticesToJson(Notices instance) => <String, dynamic>{
      'content': instance.content,
      'createTime': instance.createTime,
      'id': instance.id,
      'title': instance.title,
    };
