import 'package:json_annotation/json_annotation.dart'; 
  
part 'asset_record_list_model.g.dart';


@JsonSerializable()
  class AssetRecordListModel extends Object {

  @JsonKey(name: 'list')
  List<AssetList> list;

  @JsonKey(name: 'pageNo')
  int pageNo;

  @JsonKey(name: 'pageSize')
  int pageSize;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'totalPage')
  int totalPage;

  AssetRecordListModel(this.list,this.pageNo,this.pageSize,this.total,this.totalPage,);

  factory AssetRecordListModel.fromJson(Map<String, dynamic> srcJson) => _$AssetRecordListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AssetRecordListModelToJson(this);

}

  
@JsonSerializable()
  class AssetList extends Object {

  @JsonKey(name: 'bizType')
  int bizType;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'occurDate')
  int occurDate;

  @JsonKey(name: 'quantity')
  double quantity;

  @JsonKey(name: 'remark')
  String remark;

  @JsonKey(name: 'serialNo')
  String serialNo;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  AssetList(this.bizType,this.createTime,this.id,this.occurDate,this.quantity,this.remark,this.serialNo,this.symbol,this.type,this.userId,);

  factory AssetList.fromJson(Map<String, dynamic> srcJson) => _$AssetListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AssetListToJson(this);

}

  
