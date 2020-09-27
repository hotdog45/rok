import 'package:json_annotation/json_annotation.dart';

part 'home_data.g.dart';


@JsonSerializable()
class HomeData extends Object {

  @JsonKey(name: 'appConfigs')
  AppConfigs appConfigs;

  @JsonKey(name: 'banners')
  List<Banners> banners;

  @JsonKey(name: 'contracts')
  List<Contracts> contracts;

  @JsonKey(name: 'menus')
  List<Menus> menus;

  @JsonKey(name: 'notices')
  List<Notices> notices;

  HomeData(this.appConfigs,this.banners,this.contracts,this.menus,this.notices,);

  factory HomeData.fromJson(Map<String, dynamic> srcJson) => _$HomeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

}


@JsonSerializable()
class AppConfigs extends Object {

  @JsonKey(name: 'app_name')
  String appName;

  AppConfigs(this.appName,);

  factory AppConfigs.fromJson(Map<String, dynamic> srcJson) => _$AppConfigsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppConfigsToJson(this);

}


@JsonSerializable()
class Banners extends Object {

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'targetUrl')
  String targetUrl;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  Banners(this.imgUrl,this.targetUrl,this.title,this.type,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}


@JsonSerializable()
class Contracts extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'feeRate')
  double feeRate;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'maxMultiple')
  int maxMultiple;

  @JsonKey(name: 'maxQuantity')
  int maxQuantity;

  @JsonKey(name: 'minQuantity')
  int minQuantity;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'rate')
  int rate;

  @JsonKey(name: 'remark')
  String remark;

  @JsonKey(name: 'scale')
  int scale;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'topic')
  String topic;

  @JsonKey(name: 'tradeStatus')
  int tradeStatus;

  @JsonKey(name: 'type')
  int type;

  Contracts(this.code,this.feeRate,this.icon,this.maxMultiple,this.maxQuantity,this.minQuantity,this.name,this.rate,this.remark,this.scale,this.status,this.symbol,this.topic,this.tradeStatus,this.type,);

  factory Contracts.fromJson(Map<String, dynamic> srcJson) => _$ContractsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContractsToJson(this);

}


@JsonSerializable()
class Menus extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'targetUrl')
  String targetUrl;

  @JsonKey(name: 'title')
  String title;

  Menus(this.icon,this.targetUrl,this.title,);

  factory Menus.fromJson(Map<String, dynamic> srcJson) => _$MenusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenusToJson(this);

}


@JsonSerializable()
class Notices extends Object {

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  Notices(this.content,this.createTime,this.id,this.title,);

  factory Notices.fromJson(Map<String, dynamic> srcJson) => _$NoticesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NoticesToJson(this);

}


