import 'package:json_annotation/json_annotation.dart'; 
  
part 'withdraw_preview_model.g.dart';


@JsonSerializable()
  class withdrawPreviewModel extends Object {

  @JsonKey(name: 'availableBalance')
  double availableBalance;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'maxAmount')
  double maxAmount;

  @JsonKey(name: 'maxTimes')
  int maxTimes;

  @JsonKey(name: 'minAmount')
  double minAmount;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'times')
  int times;

  withdrawPreviewModel(this.availableBalance,this.fee,this.maxAmount,this.maxTimes,this.minAmount,this.status,this.symbol,this.times,);

  factory withdrawPreviewModel.fromJson(Map<String, dynamic> srcJson) => _$withdrawPreviewModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$withdrawPreviewModelToJson(this);

}

  
