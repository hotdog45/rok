import 'package:json_annotation/json_annotation.dart';

part 'entrust_model.g.dart';


@JsonSerializable()
class EntrustModel extends Object {

  @JsonKey(name: 'contractCode')
  String contractCode;

  @JsonKey(name: 'contractName')
  String contractName;

  @JsonKey(name: 'contractType')
  int contractType;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'fee')
  double fee;

  @JsonKey(name: 'feeRate')
  double feeRate;

  @JsonKey(name: 'multiple')
  int multiple;

  @JsonKey(name: 'occurDate')
  int occurDate;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'quantity')
  int quantity;

  @JsonKey(name: 'serialNo')
  String serialNo;

  @JsonKey(name: 'side')
  int side;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'tradePrice')
  double tradePrice;

  @JsonKey(name: 'tradeQuantity')
  int tradeQuantity;

  @JsonKey(name: 'tradeTime')
  String tradeTime;

  @JsonKey(name: 'tradeType')
  int tradeType;

  @JsonKey(name: 'type')
  int type;

  EntrustModel(this.contractCode,this.contractName,this.contractType,this.createTime,this.fee,this.feeRate,this.multiple,this.occurDate,this.price,this.quantity,this.serialNo,this.side,this.status,this.symbol,this.tradePrice,this.tradeQuantity,this.tradeTime,this.tradeType,this.type,);

  factory EntrustModel.fromJson(Map<String, dynamic> srcJson) => _$EntrustModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntrustModelToJson(this);

}


