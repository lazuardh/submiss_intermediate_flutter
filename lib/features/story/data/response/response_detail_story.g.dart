// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_detail_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseDetailStoryImpl _$$ResponseDetailStoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseDetailStoryImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      detailStory: DetailStory.fromJson(json['story']),
    );

Map<String, dynamic> _$$ResponseDetailStoryImplToJson(
        _$ResponseDetailStoryImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.detailStory,
    };
