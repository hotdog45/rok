// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GatewayBaseModel _$GatewayBaseModelFromJson(Map<String, dynamic> json) {
  return GatewayBaseModel(
    json['success'] as bool,
    json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
    json['traceId'] as String,
    json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GatewayBaseModelToJson(GatewayBaseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
      'error': instance.error,
      'traceId': instance.traceId,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(
    json['code'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['success'],
    json['result'],
    json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
      'error': instance.error,
    };
