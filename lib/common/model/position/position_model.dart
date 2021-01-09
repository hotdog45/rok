import 'package:json_annotation/json_annotation.dart';

part 'position_model.g.dart';


@JsonSerializable()
class PositionModel extends Object {

  @JsonKey(name: 'balance')
  int balance;

  @JsonKey(name: 'contactCode')
  String contactCode;

  @JsonKey(name: 'contactName')
  String contactName;

  @JsonKey(name: 'contractType')
  int contractType;

  @JsonKey(name: 'deposit')
  double deposit;

  @JsonKey(name: 'frozenBalance')
  int frozenBalance;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'lossPrice')
  double lossPrice;

  @JsonKey(name: 'maxSubDeposit')
  double maxSubDeposit;

  @JsonKey(name: 'multiple')
  int multiple;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'profit')
  double profit;

  @JsonKey(name: 'profitRate')
  double profitRate;

  @JsonKey(name: 'side')
  int side;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'tradeQuantity')
  int tradeQuantity;

  @JsonKey(name: 'tradeTime')
  String tradeTime;

  PositionModel(this.balance,this.contactCode,this.contactName,this.contractType,this.deposit,this.frozenBalance,this.id,this.lossPrice,this.maxSubDeposit,this.multiple,this.price,this.profit,this.profitRate,this.side,this.symbol,this.tradeQuantity,this.tradeTime,);

  factory PositionModel.fromJson(Map<String, dynamic> srcJson) => _$PositionModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PositionModelToJson(this);

}


