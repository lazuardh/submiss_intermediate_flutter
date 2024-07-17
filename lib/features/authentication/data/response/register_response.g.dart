// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseRegisterImpl _$$ResponseRegisterImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseRegisterImpl(
      error: json['error'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ResponseRegisterImplToJson(
        _$ResponseRegisterImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
