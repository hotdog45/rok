import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_info.g.dart';


@JsonSerializable()
  class UserInfo extends Object {

  @JsonKey(name: 'channelNo')
  String channelNo;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'kycStatus')
  int kycStatus;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'tradeStatus')
  int tradeStatus;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'verifyStatus')
  int verifyStatus;

  UserInfo(this.channelNo,this.id,this.kycStatus,this.phone,this.status,this.tradeStatus,this.userName,this.verifyStatus,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}

  
