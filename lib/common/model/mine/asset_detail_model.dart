import 'package:json_annotation/json_annotation.dart'; 
  
part 'asset_detail_model.g.dart';


@JsonSerializable()
  class AssetDetailModel extends Object {

  @JsonKey(name: 'balance')
  double balance;

  @JsonKey(name: 'btcAsset')
  double btcAsset;

  @JsonKey(name: 'deposit')
  double deposit;

  @JsonKey(name: 'profitLoss')
  double profitLoss;

  @JsonKey(name: 'totalAsset')
  double totalAsset;

  AssetDetailModel(this.balance,this.btcAsset,this.deposit,this.profitLoss,this.totalAsset,);

  factory AssetDetailModel.fromJson(Map<String, dynamic> srcJson) => _$AssetDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AssetDetailModelToJson(this);

}

  
