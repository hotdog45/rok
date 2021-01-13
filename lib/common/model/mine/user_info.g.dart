// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['channelNo'] as String,
    json['id'] as int,
    json['kycStatus'] as int,
    json['phone'] as String,
    json['status'] as int,
    json['tradeStatus'] as int,
    json['userName'] as String,
    json['verifyStatus'] as int,
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'channelNo': instance.channelNo,
      'id': instance.id,
      'kycStatus': instance.kycStatus,
      'phone': instance.phone,
      'status': instance.status,
      'tradeStatus': instance.tradeStatus,
      'userName': instance.userName,
      'verifyStatus': instance.verifyStatus,
    };
