// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseRegister _$ResponseRegisterFromJson(Map<String, dynamic> json) {
  return _ResponseRegister.fromJson(json);
}

/// @nodoc
mixin _$ResponseRegister {
  String get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseRegisterCopyWith<ResponseRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseRegisterCopyWith<$Res> {
  factory $ResponseRegisterCopyWith(
          ResponseRegister value, $Res Function(ResponseRegister) then) =
      _$ResponseRegisterCopyWithImpl<$Res, ResponseRegister>;
  @useResult
  $Res call({String error, String? message});
}

/// @nodoc
class _$ResponseRegisterCopyWithImpl<$Res, $Val extends ResponseRegister>
    implements $ResponseRegisterCopyWith<$Res> {
  _$ResponseRegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseRegisterImplCopyWith<$Res>
    implements $ResponseRegisterCopyWith<$Res> {
  factory _$$ResponseRegisterImplCopyWith(_$ResponseRegisterImpl value,
          $Res Function(_$ResponseRegisterImpl) then) =
      __$$ResponseRegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, String? message});
}

/// @nodoc
class __$$ResponseRegisterImplCopyWithImpl<$Res>
    extends _$ResponseRegisterCopyWithImpl<$Res, _$ResponseRegisterImpl>
    implements _$$ResponseRegisterImplCopyWith<$Res> {
  __$$ResponseRegisterImplCopyWithImpl(_$ResponseRegisterImpl _value,
      $Res Function(_$ResponseRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = freezed,
  }) {
    return _then(_$ResponseRegisterImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseRegisterImpl implements _ResponseRegister {
  const _$ResponseRegisterImpl({required this.error, required this.message});

  factory _$ResponseRegisterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseRegisterImplFromJson(json);

  @override
  final String error;
  @override
  final String? message;

  @override
  String toString() {
    return 'ResponseRegister(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseRegisterImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseRegisterImplCopyWith<_$ResponseRegisterImpl> get copyWith =>
      __$$ResponseRegisterImplCopyWithImpl<_$ResponseRegisterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseRegisterImplToJson(
      this,
    );
  }
}

abstract class _ResponseRegister implements ResponseRegister {
  const factory _ResponseRegister(
      {required final String error,
      required final String? message}) = _$ResponseRegisterImpl;

  factory _ResponseRegister.fromJson(Map<String, dynamic> json) =
      _$ResponseRegisterImpl.fromJson;

  @override
  String get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ResponseRegisterImplCopyWith<_$ResponseRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
