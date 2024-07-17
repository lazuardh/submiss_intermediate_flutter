// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_detail_story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseDetailStory _$ResponseDetailStoryFromJson(Map<String, dynamic> json) {
  return _ResponseDetailStory.fromJson(json);
}

/// @nodoc
mixin _$ResponseDetailStory {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'story')
  DetailStory get detailStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseDetailStoryCopyWith<ResponseDetailStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseDetailStoryCopyWith<$Res> {
  factory $ResponseDetailStoryCopyWith(
          ResponseDetailStory value, $Res Function(ResponseDetailStory) then) =
      _$ResponseDetailStoryCopyWithImpl<$Res, ResponseDetailStory>;
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: 'story') DetailStory detailStory});

  $DetailStoryCopyWith<$Res> get detailStory;
}

/// @nodoc
class _$ResponseDetailStoryCopyWithImpl<$Res, $Val extends ResponseDetailStory>
    implements $ResponseDetailStoryCopyWith<$Res> {
  _$ResponseDetailStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? detailStory = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detailStory: null == detailStory
          ? _value.detailStory
          : detailStory // ignore: cast_nullable_to_non_nullable
              as DetailStory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailStoryCopyWith<$Res> get detailStory {
    return $DetailStoryCopyWith<$Res>(_value.detailStory, (value) {
      return _then(_value.copyWith(detailStory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseDetailStoryImplCopyWith<$Res>
    implements $ResponseDetailStoryCopyWith<$Res> {
  factory _$$ResponseDetailStoryImplCopyWith(_$ResponseDetailStoryImpl value,
          $Res Function(_$ResponseDetailStoryImpl) then) =
      __$$ResponseDetailStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: 'story') DetailStory detailStory});

  @override
  $DetailStoryCopyWith<$Res> get detailStory;
}

/// @nodoc
class __$$ResponseDetailStoryImplCopyWithImpl<$Res>
    extends _$ResponseDetailStoryCopyWithImpl<$Res, _$ResponseDetailStoryImpl>
    implements _$$ResponseDetailStoryImplCopyWith<$Res> {
  __$$ResponseDetailStoryImplCopyWithImpl(_$ResponseDetailStoryImpl _value,
      $Res Function(_$ResponseDetailStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? detailStory = null,
  }) {
    return _then(_$ResponseDetailStoryImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detailStory: null == detailStory
          ? _value.detailStory
          : detailStory // ignore: cast_nullable_to_non_nullable
              as DetailStory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseDetailStoryImpl implements _ResponseDetailStory {
  const _$ResponseDetailStoryImpl(
      {required this.error,
      required this.message,
      @JsonKey(name: 'story') required this.detailStory});

  factory _$ResponseDetailStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseDetailStoryImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @override
  @JsonKey(name: 'story')
  final DetailStory detailStory;

  @override
  String toString() {
    return 'ResponseDetailStory(error: $error, message: $message, detailStory: $detailStory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseDetailStoryImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.detailStory, detailStory) ||
                other.detailStory == detailStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, detailStory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseDetailStoryImplCopyWith<_$ResponseDetailStoryImpl> get copyWith =>
      __$$ResponseDetailStoryImplCopyWithImpl<_$ResponseDetailStoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseDetailStoryImplToJson(
      this,
    );
  }
}

abstract class _ResponseDetailStory implements ResponseDetailStory {
  const factory _ResponseDetailStory(
          {required final bool error,
          required final String message,
          @JsonKey(name: 'story') required final DetailStory detailStory}) =
      _$ResponseDetailStoryImpl;

  factory _ResponseDetailStory.fromJson(Map<String, dynamic> json) =
      _$ResponseDetailStoryImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(name: 'story')
  DetailStory get detailStory;
  @override
  @JsonKey(ignore: true)
  _$$ResponseDetailStoryImplCopyWith<_$ResponseDetailStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
