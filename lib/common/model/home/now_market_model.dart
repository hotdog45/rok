import 'package:json_annotation/json_annotation.dart';

import 'home_data.dart';

part 'now_market_model.g.dart';


@JsonSerializable()
class NowMarketBaseModel extends Object {
  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<Contracts> data;

  @JsonKey(name: 'code')
  int code;

  NowMarketBaseModel(
      this.message,
      this.data,
      this.code,
      );

  factory NowMarketBaseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$NowMarketBaseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NowMarketBaseModelToJson(this);
}


@JsonSerializable()
class NowMarketModel extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'low')
  double low;

  @JsonKey(name: 'high')
  double high;

  @JsonKey(name: 'open')
  double open;

  @JsonKey(name: 'close')
  double close;

  @JsonKey(name: 'vol')
  double vol;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'version')
  int version;

  @JsonKey(name: 'count')
  int count;


  NowMarketModel(this.id,this.low,this.high,this.open,this.close,this.vol,this.amount,this.version,this.count,);

  factory NowMarketModel.fromJson(Map<String, dynamic> srcJson) => _$NowMarketModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NowMarketModelToJson(this);

}


