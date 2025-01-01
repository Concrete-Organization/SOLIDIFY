// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'engineer_sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EngineerSignUpState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() engineerSignUpLoading,
    required TResult Function(T data) engineerSignUpSuccess,
    required TResult Function(ApiErrorModel error) engineerSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? engineerSignUpLoading,
    TResult? Function(T data)? engineerSignUpSuccess,
    TResult? Function(ApiErrorModel error)? engineerSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? engineerSignUpLoading,
    TResult Function(T data)? engineerSignUpSuccess,
    TResult Function(ApiErrorModel error)? engineerSignUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EngineerSignUpLoading<T> value)
        engineerSignUpLoading,
    required TResult Function(EngineerSignUpSuccess<T> value)
        engineerSignUpSuccess,
    required TResult Function(EngineerSignUpError<T> value) engineerSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult? Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult? Function(EngineerSignUpError<T> value)? engineerSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult Function(EngineerSignUpError<T> value)? engineerSignUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EngineerSignUpStateCopyWith<T, $Res> {
  factory $EngineerSignUpStateCopyWith(EngineerSignUpState<T> value,
          $Res Function(EngineerSignUpState<T>) then) =
      _$EngineerSignUpStateCopyWithImpl<T, $Res, EngineerSignUpState<T>>;
}

/// @nodoc
class _$EngineerSignUpStateCopyWithImpl<T, $Res,
        $Val extends EngineerSignUpState<T>>
    implements $EngineerSignUpStateCopyWith<T, $Res> {
  _$EngineerSignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$EngineerSignUpStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EngineerSignUpState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() engineerSignUpLoading,
    required TResult Function(T data) engineerSignUpSuccess,
    required TResult Function(ApiErrorModel error) engineerSignUpError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? engineerSignUpLoading,
    TResult? Function(T data)? engineerSignUpSuccess,
    TResult? Function(ApiErrorModel error)? engineerSignUpError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? engineerSignUpLoading,
    TResult Function(T data)? engineerSignUpSuccess,
    TResult Function(ApiErrorModel error)? engineerSignUpError,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EngineerSignUpLoading<T> value)
        engineerSignUpLoading,
    required TResult Function(EngineerSignUpSuccess<T> value)
        engineerSignUpSuccess,
    required TResult Function(EngineerSignUpError<T> value) engineerSignUpError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult? Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult? Function(EngineerSignUpError<T> value)? engineerSignUpError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult Function(EngineerSignUpError<T> value)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements EngineerSignUpState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$EngineerSignUpLoadingImplCopyWith<T, $Res> {
  factory _$$EngineerSignUpLoadingImplCopyWith(
          _$EngineerSignUpLoadingImpl<T> value,
          $Res Function(_$EngineerSignUpLoadingImpl<T>) then) =
      __$$EngineerSignUpLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$EngineerSignUpLoadingImplCopyWithImpl<T, $Res>
    extends _$EngineerSignUpStateCopyWithImpl<T, $Res,
        _$EngineerSignUpLoadingImpl<T>>
    implements _$$EngineerSignUpLoadingImplCopyWith<T, $Res> {
  __$$EngineerSignUpLoadingImplCopyWithImpl(
      _$EngineerSignUpLoadingImpl<T> _value,
      $Res Function(_$EngineerSignUpLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EngineerSignUpLoadingImpl<T> implements EngineerSignUpLoading<T> {
  const _$EngineerSignUpLoadingImpl();

  @override
  String toString() {
    return 'EngineerSignUpState<$T>.engineerSignUpLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EngineerSignUpLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() engineerSignUpLoading,
    required TResult Function(T data) engineerSignUpSuccess,
    required TResult Function(ApiErrorModel error) engineerSignUpError,
  }) {
    return engineerSignUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? engineerSignUpLoading,
    TResult? Function(T data)? engineerSignUpSuccess,
    TResult? Function(ApiErrorModel error)? engineerSignUpError,
  }) {
    return engineerSignUpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? engineerSignUpLoading,
    TResult Function(T data)? engineerSignUpSuccess,
    TResult Function(ApiErrorModel error)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (engineerSignUpLoading != null) {
      return engineerSignUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EngineerSignUpLoading<T> value)
        engineerSignUpLoading,
    required TResult Function(EngineerSignUpSuccess<T> value)
        engineerSignUpSuccess,
    required TResult Function(EngineerSignUpError<T> value) engineerSignUpError,
  }) {
    return engineerSignUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult? Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult? Function(EngineerSignUpError<T> value)? engineerSignUpError,
  }) {
    return engineerSignUpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult Function(EngineerSignUpError<T> value)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (engineerSignUpLoading != null) {
      return engineerSignUpLoading(this);
    }
    return orElse();
  }
}

abstract class EngineerSignUpLoading<T> implements EngineerSignUpState<T> {
  const factory EngineerSignUpLoading() = _$EngineerSignUpLoadingImpl<T>;
}

/// @nodoc
abstract class _$$EngineerSignUpSuccessImplCopyWith<T, $Res> {
  factory _$$EngineerSignUpSuccessImplCopyWith(
          _$EngineerSignUpSuccessImpl<T> value,
          $Res Function(_$EngineerSignUpSuccessImpl<T>) then) =
      __$$EngineerSignUpSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$EngineerSignUpSuccessImplCopyWithImpl<T, $Res>
    extends _$EngineerSignUpStateCopyWithImpl<T, $Res,
        _$EngineerSignUpSuccessImpl<T>>
    implements _$$EngineerSignUpSuccessImplCopyWith<T, $Res> {
  __$$EngineerSignUpSuccessImplCopyWithImpl(
      _$EngineerSignUpSuccessImpl<T> _value,
      $Res Function(_$EngineerSignUpSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$EngineerSignUpSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EngineerSignUpSuccessImpl<T> implements EngineerSignUpSuccess<T> {
  const _$EngineerSignUpSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'EngineerSignUpState<$T>.engineerSignUpSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EngineerSignUpSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EngineerSignUpSuccessImplCopyWith<T, _$EngineerSignUpSuccessImpl<T>>
      get copyWith => __$$EngineerSignUpSuccessImplCopyWithImpl<T,
          _$EngineerSignUpSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() engineerSignUpLoading,
    required TResult Function(T data) engineerSignUpSuccess,
    required TResult Function(ApiErrorModel error) engineerSignUpError,
  }) {
    return engineerSignUpSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? engineerSignUpLoading,
    TResult? Function(T data)? engineerSignUpSuccess,
    TResult? Function(ApiErrorModel error)? engineerSignUpError,
  }) {
    return engineerSignUpSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? engineerSignUpLoading,
    TResult Function(T data)? engineerSignUpSuccess,
    TResult Function(ApiErrorModel error)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (engineerSignUpSuccess != null) {
      return engineerSignUpSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EngineerSignUpLoading<T> value)
        engineerSignUpLoading,
    required TResult Function(EngineerSignUpSuccess<T> value)
        engineerSignUpSuccess,
    required TResult Function(EngineerSignUpError<T> value) engineerSignUpError,
  }) {
    return engineerSignUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult? Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult? Function(EngineerSignUpError<T> value)? engineerSignUpError,
  }) {
    return engineerSignUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult Function(EngineerSignUpError<T> value)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (engineerSignUpSuccess != null) {
      return engineerSignUpSuccess(this);
    }
    return orElse();
  }
}

abstract class EngineerSignUpSuccess<T> implements EngineerSignUpState<T> {
  const factory EngineerSignUpSuccess(final T data) =
      _$EngineerSignUpSuccessImpl<T>;

  T get data;

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EngineerSignUpSuccessImplCopyWith<T, _$EngineerSignUpSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EngineerSignUpErrorImplCopyWith<T, $Res> {
  factory _$$EngineerSignUpErrorImplCopyWith(_$EngineerSignUpErrorImpl<T> value,
          $Res Function(_$EngineerSignUpErrorImpl<T>) then) =
      __$$EngineerSignUpErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$EngineerSignUpErrorImplCopyWithImpl<T, $Res>
    extends _$EngineerSignUpStateCopyWithImpl<T, $Res,
        _$EngineerSignUpErrorImpl<T>>
    implements _$$EngineerSignUpErrorImplCopyWith<T, $Res> {
  __$$EngineerSignUpErrorImplCopyWithImpl(_$EngineerSignUpErrorImpl<T> _value,
      $Res Function(_$EngineerSignUpErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$EngineerSignUpErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$EngineerSignUpErrorImpl<T> implements EngineerSignUpError<T> {
  const _$EngineerSignUpErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'EngineerSignUpState<$T>.engineerSignUpError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EngineerSignUpErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EngineerSignUpErrorImplCopyWith<T, _$EngineerSignUpErrorImpl<T>>
      get copyWith => __$$EngineerSignUpErrorImplCopyWithImpl<T,
          _$EngineerSignUpErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() engineerSignUpLoading,
    required TResult Function(T data) engineerSignUpSuccess,
    required TResult Function(ApiErrorModel error) engineerSignUpError,
  }) {
    return engineerSignUpError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? engineerSignUpLoading,
    TResult? Function(T data)? engineerSignUpSuccess,
    TResult? Function(ApiErrorModel error)? engineerSignUpError,
  }) {
    return engineerSignUpError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? engineerSignUpLoading,
    TResult Function(T data)? engineerSignUpSuccess,
    TResult Function(ApiErrorModel error)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (engineerSignUpError != null) {
      return engineerSignUpError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EngineerSignUpLoading<T> value)
        engineerSignUpLoading,
    required TResult Function(EngineerSignUpSuccess<T> value)
        engineerSignUpSuccess,
    required TResult Function(EngineerSignUpError<T> value) engineerSignUpError,
  }) {
    return engineerSignUpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult? Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult? Function(EngineerSignUpError<T> value)? engineerSignUpError,
  }) {
    return engineerSignUpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EngineerSignUpLoading<T> value)? engineerSignUpLoading,
    TResult Function(EngineerSignUpSuccess<T> value)? engineerSignUpSuccess,
    TResult Function(EngineerSignUpError<T> value)? engineerSignUpError,
    required TResult orElse(),
  }) {
    if (engineerSignUpError != null) {
      return engineerSignUpError(this);
    }
    return orElse();
  }
}

abstract class EngineerSignUpError<T> implements EngineerSignUpState<T> {
  const factory EngineerSignUpError({required final ApiErrorModel error}) =
      _$EngineerSignUpErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of EngineerSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EngineerSignUpErrorImplCopyWith<T, _$EngineerSignUpErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
