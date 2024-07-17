// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryResponse _$StoryResponseFromJson(Map<String, dynamic> json) {
  return _StoryResponse.fromJson(json);
}

/// @nodoc
mixin _$StoryResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'listStory')
  List<Story> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryResponseCopyWith<StoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryResponseCopyWith<$Res> {
  factory $StoryResponseCopyWith(
          StoryResponse value, $Res Function(StoryResponse) then) =
      _$StoryResponseCopyWithImpl<$Res, StoryResponse>;
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: 'listStory') List<Story> list});
}

/// @nodoc
class _$StoryResponseCopyWithImpl<$Res, $Val extends StoryResponse>
    implements $StoryResponseCopyWith<$Res> {
  _$StoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? list = null,
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
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryResponseImplCopyWith<$Res>
    implements $StoryResponseCopyWith<$Res> {
  factory _$$StoryResponseImplCopyWith(
          _$StoryResponseImpl value, $Res Function(_$StoryResponseImpl) then) =
      __$$StoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: 'listStory') List<Story> list});
}

/// @nodoc
class __$$StoryResponseImplCopyWithImpl<$Res>
    extends _$StoryResponseCopyWithImpl<$Res, _$StoryResponseImpl>
    implements _$$StoryResponseImplCopyWith<$Res> {
  __$$StoryResponseImplCopyWithImpl(
      _$StoryResponseImpl _value, $Res Function(_$StoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? list = null,
  }) {
    return _then(_$StoryResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryResponseImpl implements _StoryResponse {
  const _$StoryResponseImpl(
      {required this.error,
      required this.message,
      @JsonKey(name: 'listStory') required final List<Story> list})
      : _list = list;

  factory _$StoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<Story> _list;
  @override
  @JsonKey(name: 'listStory')
  List<Story> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'StoryResponse(error: $error, message: $message, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, error, message, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryResponseImplCopyWith<_$StoryResponseImpl> get copyWith =>
      __$$StoryResponseImplCopyWithImpl<_$StoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryResponseImplToJson(
      this,
    );
  }
}

abstract class _StoryResponse implements StoryResponse {
  const factory _StoryResponse(
          {required final bool error,
          required final String message,
          @JsonKey(name: 'listStory') required final List<Story> list}) =
      _$StoryResponseImpl;

  factory _StoryResponse.fromJson(Map<String, dynamic> json) =
      _$StoryResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(name: 'listStory')
  List<Story> get list;
  @override
  @JsonKey(ignore: true)
  _$$StoryResponseImplCopyWith<_$StoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
