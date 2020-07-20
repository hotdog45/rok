// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_upgrade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUpgrade _$AppUpgradeFromJson(Map<String, dynamic> json) {
  return AppUpgrade(
    json['upgradeInfo'] as String,
    json['status'] as int,
    json['version'] as String,
    json['downloadUrl'] as String,
  );
}

Map<String, dynamic> _$AppUpgradeToJson(AppUpgrade instance) =>
    <String, dynamic>{
      'upgradeInfo': instance.upgradeInfo,
      'status': instance.status,
      'version': instance.version,
      'downloadUrl': instance.downloadUrl,
    };
