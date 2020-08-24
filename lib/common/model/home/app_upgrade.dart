import 'package:json_annotation/json_annotation.dart';

part 'app_upgrade.g.dart';

@JsonSerializable()
class AppUpgrade extends Object {
  @JsonKey(name: 'upgradeInfo')
  String upgradeInfo;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'version')
  String version;

  @JsonKey(name: 'downloadUrl')
  String downloadUrl;

  AppUpgrade(
    this.upgradeInfo,
    this.status,
    this.version,
    this.downloadUrl,
  );

  factory AppUpgrade.fromJson(Map<String, dynamic> srcJson) =>
      _$AppUpgradeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppUpgradeToJson(this);
}
