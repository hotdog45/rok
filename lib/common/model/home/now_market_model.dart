import 'package:json_annotation/json_annotation.dart';

part 'now_market_model.g.dart';


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


