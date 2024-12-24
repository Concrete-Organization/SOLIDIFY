// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSignUpState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() userSignUpLoading,
    required TResult Function(T data) userSignUpSuccess,
    required TResult Function(ApiErrorModel error) userSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? userSignUpLoading,
    TResult? Function(T data)? userSignUpSuccess,
    TResult? Function(ApiErrorModel error)? userSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? userSignUpLoading,
    TResult Function(T data)? userSignUpSuccess,
    TResult Function(ApiErrorModel error)? userSignUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignUpLoading<T> value) userSignUpLoading,
    required TResult Function(SignUpSuccess<T> value) userSignUpSuccess,
    required TResult Function(SignUpError<T> value) userSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult? Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult? Function(SignUpError<T> value)? userSignUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult Function(SignUpError<T> value)? userSignUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignUpStateCopyWith<T, $Res> {
  factory $UserSignUpStateCopyWith(
          UserSignUpState<T> value, $Res Function(UserSignUpState<T>) then) =
      _$UserSignUpStateCopyWithImpl<T, $Res, UserSignUpState<T>>;
}

/// @nodoc
class _$UserSignUpStateCopyWithImpl<T, $Res, $Val extends UserSignUpState<T>>
    implements $UserSignUpStateCopyWith<T, $Res> {
  _$UserSignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSignUpState
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
    extends _$UserSignUpStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserSignUpState<$T>.initial()';
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
    required TResult Function() userSignUpLoading,
    required TResult Function(T data) userSignUpSuccess,
    required TResult Function(ApiErrorModel error) userSignUpError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? userSignUpLoading,
    TResult? Function(T data)? userSignUpSuccess,
    TResult? Function(ApiErrorModel error)? userSignUpError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? userSignUpLoading,
    TResult Function(T data)? userSignUpSuccess,
    TResult Function(ApiErrorModel error)? userSignUpError,
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
    required TResult Function(SignUpLoading<T> value) userSignUpLoading,
    required TResult Function(SignUpSuccess<T> value) userSignUpSuccess,
    required TResult Function(SignUpError<T> value) userSignUpError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult? Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult? Function(SignUpError<T> value)? userSignUpError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult Function(SignUpError<T> value)? userSignUpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements UserSignUpState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$SignUpLoadingImplCopyWith<T, $Res> {
  factory _$$SignUpLoadingImplCopyWith(_$SignUpLoadingImpl<T> value,
          $Res Function(_$SignUpLoadingImpl<T>) then) =
      __$$SignUpLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SignUpLoadingImplCopyWithImpl<T, $Res>
    extends _$UserSignUpStateCopyWithImpl<T, $Res, _$SignUpLoadingImpl<T>>
    implements _$$SignUpLoadingImplCopyWith<T, $Res> {
  __$$SignUpLoadingImplCopyWithImpl(_$SignUpLoadingImpl<T> _value,
      $Res Function(_$SignUpLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpLoadingImpl<T> implements SignUpLoading<T> {
  const _$SignUpLoadingImpl();

  @override
  String toString() {
    return 'UserSignUpState<$T>.userSignUpLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() userSignUpLoading,
    required TResult Function(T data) userSignUpSuccess,
    required TResult Function(ApiErrorModel error) userSignUpError,
  }) {
    return userSignUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? userSignUpLoading,
    TResult? Function(T data)? userSignUpSuccess,
    TResult? Function(ApiErrorModel error)? userSignUpError,
  }) {
    return userSignUpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? userSignUpLoading,
    TResult Function(T data)? userSignUpSuccess,
    TResult Function(ApiErrorModel error)? userSignUpError,
    required TResult orElse(),
  }) {
    if (userSignUpLoading != null) {
      return userSignUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignUpLoading<T> value) userSignUpLoading,
    required TResult Function(SignUpSuccess<T> value) userSignUpSuccess,
    required TResult Function(SignUpError<T> value) userSignUpError,
  }) {
    return userSignUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult? Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult? Function(SignUpError<T> value)? userSignUpError,
  }) {
    return userSignUpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult Function(SignUpError<T> value)? userSignUpError,
    required TResult orElse(),
  }) {
    if (userSignUpLoading != null) {
      return userSignUpLoading(this);
    }
    return orElse();
  }
}

abstract class SignUpLoading<T> implements UserSignUpState<T> {
  const factory SignUpLoading() = _$SignUpLoadingImpl<T>;
}

/// @nodoc
abstract class _$$SignUpSuccessImplCopyWith<T, $Res> {
  factory _$$SignUpSuccessImplCopyWith(_$SignUpSuccessImpl<T> value,
          $Res Function(_$SignUpSuccessImpl<T>) then) =
      __$$SignUpSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SignUpSuccessImplCopyWithImpl<T, $Res>
    extends _$UserSignUpStateCopyWithImpl<T, $Res, _$SignUpSuccessImpl<T>>
    implements _$$SignUpSuccessImplCopyWith<T, $Res> {
  __$$SignUpSuccessImplCopyWithImpl(_$SignUpSuccessImpl<T> _value,
      $Res Function(_$SignUpSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SignUpSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SignUpSuccessImpl<T> implements SignUpSuccess<T> {
  const _$SignUpSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'UserSignUpState<$T>.userSignUpSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpSuccessImplCopyWith<T, _$SignUpSuccessImpl<T>> get copyWith =>
      __$$SignUpSuccessImplCopyWithImpl<T, _$SignUpSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() userSignUpLoading,
    required TResult Function(T data) userSignUpSuccess,
    required TResult Function(ApiErrorModel error) userSignUpError,
  }) {
    return userSignUpSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? userSignUpLoading,
    TResult? Function(T data)? userSignUpSuccess,
    TResult? Function(ApiErrorModel error)? userSignUpError,
  }) {
    return userSignUpSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? userSignUpLoading,
    TResult Function(T data)? userSignUpSuccess,
    TResult Function(ApiErrorModel error)? userSignUpError,
    required TResult orElse(),
  }) {
    if (userSignUpSuccess != null) {
      return userSignUpSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignUpLoading<T> value) userSignUpLoading,
    required TResult Function(SignUpSuccess<T> value) userSignUpSuccess,
    required TResult Function(SignUpError<T> value) userSignUpError,
  }) {
    return userSignUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult? Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult? Function(SignUpError<T> value)? userSignUpError,
  }) {
    return userSignUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult Function(SignUpError<T> value)? userSignUpError,
    required TResult orElse(),
  }) {
    if (userSignUpSuccess != null) {
      return userSignUpSuccess(this);
    }
    return orElse();
  }
}

abstract class SignUpSuccess<T> implements UserSignUpState<T> {
  const factory SignUpSuccess(final T data) = _$SignUpSuccessImpl<T>;

  T get data;

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpSuccessImplCopyWith<T, _$SignUpSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpErrorImplCopyWith<T, $Res> {
  factory _$$SignUpErrorImplCopyWith(_$SignUpErrorImpl<T> value,
          $Res Function(_$SignUpErrorImpl<T>) then) =
      __$$SignUpErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$SignUpErrorImplCopyWithImpl<T, $Res>
    extends _$UserSignUpStateCopyWithImpl<T, $Res, _$SignUpErrorImpl<T>>
    implements _$$SignUpErrorImplCopyWith<T, $Res> {
  __$$SignUpErrorImplCopyWithImpl(
      _$SignUpErrorImpl<T> _value, $Res Function(_$SignUpErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignUpErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$SignUpErrorImpl<T> implements SignUpError<T> {
  const _$SignUpErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'UserSignUpState<$T>.userSignUpError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpErrorImplCopyWith<T, _$SignUpErrorImpl<T>> get copyWith =>
      __$$SignUpErrorImplCopyWithImpl<T, _$SignUpErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() userSignUpLoading,
    required TResult Function(T data) userSignUpSuccess,
    required TResult Function(ApiErrorModel error) userSignUpError,
  }) {
    return userSignUpError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? userSignUpLoading,
    TResult? Function(T data)? userSignUpSuccess,
    TResult? Function(ApiErrorModel error)? userSignUpError,
  }) {
    return userSignUpError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? userSignUpLoading,
    TResult Function(T data)? userSignUpSuccess,
    TResult Function(ApiErrorModel error)? userSignUpError,
    required TResult orElse(),
  }) {
    if (userSignUpError != null) {
      return userSignUpError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignUpLoading<T> value) userSignUpLoading,
    required TResult Function(SignUpSuccess<T> value) userSignUpSuccess,
    required TResult Function(SignUpError<T> value) userSignUpError,
  }) {
    return userSignUpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult? Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult? Function(SignUpError<T> value)? userSignUpError,
  }) {
    return userSignUpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignUpLoading<T> value)? userSignUpLoading,
    TResult Function(SignUpSuccess<T> value)? userSignUpSuccess,
    TResult Function(SignUpError<T> value)? userSignUpError,
    required TResult orElse(),
  }) {
    if (userSignUpError != null) {
      return userSignUpError(this);
    }
    return orElse();
  }
}

abstract class SignUpError<T> implements UserSignUpState<T> {
  const factory SignUpError({required final ApiErrorModel error}) =
      _$SignUpErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of UserSignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpErrorImplCopyWith<T, _$SignUpErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
