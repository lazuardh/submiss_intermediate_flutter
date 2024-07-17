// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryStateInitial value) initial,
    required TResult Function(StoryStateLoading value) loading,
    required TResult Function(StoryStateLoaded value) loaded,
    required TResult Function(StoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoryStateInitial value)? initial,
    TResult? Function(StoryStateLoading value)? loading,
    TResult? Function(StoryStateLoaded value)? loaded,
    TResult? Function(StoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryStateInitial value)? initial,
    TResult Function(StoryStateLoading value)? loading,
    TResult Function(StoryStateLoaded value)? loaded,
    TResult Function(StoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res, StoryState>;
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res, $Val extends StoryState>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StoryStateInitialImplCopyWith<$Res> {
  factory _$$StoryStateInitialImplCopyWith(_$StoryStateInitialImpl value,
          $Res Function(_$StoryStateInitialImpl) then) =
      __$$StoryStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoryStateInitialImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryStateInitialImpl>
    implements _$$StoryStateInitialImplCopyWith<$Res> {
  __$$StoryStateInitialImplCopyWithImpl(_$StoryStateInitialImpl _value,
      $Res Function(_$StoryStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoryStateInitialImpl implements StoryStateInitial {
  const _$StoryStateInitialImpl();

  @override
  String toString() {
    return 'StoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoryStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryStateInitial value) initial,
    required TResult Function(StoryStateLoading value) loading,
    required TResult Function(StoryStateLoaded value) loaded,
    required TResult Function(StoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoryStateInitial value)? initial,
    TResult? Function(StoryStateLoading value)? loading,
    TResult? Function(StoryStateLoaded value)? loaded,
    TResult? Function(StoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryStateInitial value)? initial,
    TResult Function(StoryStateLoading value)? loading,
    TResult Function(StoryStateLoaded value)? loaded,
    TResult Function(StoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StoryStateInitial implements StoryState {
  const factory StoryStateInitial() = _$StoryStateInitialImpl;
}

/// @nodoc
abstract class _$$StoryStateLoadingImplCopyWith<$Res> {
  factory _$$StoryStateLoadingImplCopyWith(_$StoryStateLoadingImpl value,
          $Res Function(_$StoryStateLoadingImpl) then) =
      __$$StoryStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoryStateLoadingImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryStateLoadingImpl>
    implements _$$StoryStateLoadingImplCopyWith<$Res> {
  __$$StoryStateLoadingImplCopyWithImpl(_$StoryStateLoadingImpl _value,
      $Res Function(_$StoryStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoryStateLoadingImpl implements StoryStateLoading {
  const _$StoryStateLoadingImpl();

  @override
  String toString() {
    return 'StoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoryStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryStateInitial value) initial,
    required TResult Function(StoryStateLoading value) loading,
    required TResult Function(StoryStateLoaded value) loaded,
    required TResult Function(StoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoryStateInitial value)? initial,
    TResult? Function(StoryStateLoading value)? loading,
    TResult? Function(StoryStateLoaded value)? loaded,
    TResult? Function(StoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryStateInitial value)? initial,
    TResult Function(StoryStateLoading value)? loading,
    TResult Function(StoryStateLoaded value)? loaded,
    TResult Function(StoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StoryStateLoading implements StoryState {
  const factory StoryStateLoading() = _$StoryStateLoadingImpl;
}

/// @nodoc
abstract class _$$StoryStateLoadedImplCopyWith<$Res> {
  factory _$$StoryStateLoadedImplCopyWith(_$StoryStateLoadedImpl value,
          $Res Function(_$StoryStateLoadedImpl) then) =
      __$$StoryStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Story> data});
}

/// @nodoc
class __$$StoryStateLoadedImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryStateLoadedImpl>
    implements _$$StoryStateLoadedImplCopyWith<$Res> {
  __$$StoryStateLoadedImplCopyWithImpl(_$StoryStateLoadedImpl _value,
      $Res Function(_$StoryStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$StoryStateLoadedImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc

class _$StoryStateLoadedImpl implements StoryStateLoaded {
  const _$StoryStateLoadedImpl(final List<Story> data) : _data = data;

  final List<Story> _data;
  @override
  List<Story> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StoryState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryStateLoadedImplCopyWith<_$StoryStateLoadedImpl> get copyWith =>
      __$$StoryStateLoadedImplCopyWithImpl<_$StoryStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryStateInitial value) initial,
    required TResult Function(StoryStateLoading value) loading,
    required TResult Function(StoryStateLoaded value) loaded,
    required TResult Function(StoryStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoryStateInitial value)? initial,
    TResult? Function(StoryStateLoading value)? loading,
    TResult? Function(StoryStateLoaded value)? loaded,
    TResult? Function(StoryStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryStateInitial value)? initial,
    TResult Function(StoryStateLoading value)? loading,
    TResult Function(StoryStateLoaded value)? loaded,
    TResult Function(StoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StoryStateLoaded implements StoryState {
  const factory StoryStateLoaded(final List<Story> data) =
      _$StoryStateLoadedImpl;

  List<Story> get data;
  @JsonKey(ignore: true)
  _$$StoryStateLoadedImplCopyWith<_$StoryStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoryStateErrorImplCopyWith<$Res> {
  factory _$$StoryStateErrorImplCopyWith(_$StoryStateErrorImpl value,
          $Res Function(_$StoryStateErrorImpl) then) =
      __$$StoryStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StoryStateErrorImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryStateErrorImpl>
    implements _$$StoryStateErrorImplCopyWith<$Res> {
  __$$StoryStateErrorImplCopyWithImpl(
      _$StoryStateErrorImpl _value, $Res Function(_$StoryStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StoryStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoryStateErrorImpl implements StoryStateError {
  const _$StoryStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'StoryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryStateErrorImplCopyWith<_$StoryStateErrorImpl> get copyWith =>
      __$$StoryStateErrorImplCopyWithImpl<_$StoryStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryStateInitial value) initial,
    required TResult Function(StoryStateLoading value) loading,
    required TResult Function(StoryStateLoaded value) loaded,
    required TResult Function(StoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoryStateInitial value)? initial,
    TResult? Function(StoryStateLoading value)? loading,
    TResult? Function(StoryStateLoaded value)? loaded,
    TResult? Function(StoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryStateInitial value)? initial,
    TResult Function(StoryStateLoading value)? loading,
    TResult Function(StoryStateLoaded value)? loaded,
    TResult Function(StoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StoryStateError implements StoryState {
  const factory StoryStateError(final String message) = _$StoryStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$StoryStateErrorImplCopyWith<_$StoryStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
