// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CartLoadingImplCopyWith<$Res> {
  factory _$$CartLoadingImplCopyWith(
          _$CartLoadingImpl value, $Res Function(_$CartLoadingImpl) then) =
      __$$CartLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$CartLoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartLoadingImpl>
    implements _$$CartLoadingImplCopyWith<$Res> {
  __$$CartLoadingImplCopyWithImpl(
      _$CartLoadingImpl _value, $Res Function(_$CartLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$CartLoadingImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartLoadingImpl implements CartLoading {
  const _$CartLoadingImpl(this.productId);

  @override
  final String productId;

  @override
  String toString() {
    return 'CartState.loading(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartLoadingImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartLoadingImplCopyWith<_$CartLoadingImpl> get copyWith =>
      __$$CartLoadingImplCopyWithImpl<_$CartLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return loading(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return loading?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CartLoading implements CartState {
  const factory CartLoading(final String productId) = _$CartLoadingImpl;

  String get productId;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartLoadingImplCopyWith<_$CartLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartSuccessImplCopyWith<$Res> {
  factory _$$CartSuccessImplCopyWith(
          _$CartSuccessImpl value, $Res Function(_$CartSuccessImpl) then) =
      __$$CartSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$CartSuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartSuccessImpl>
    implements _$$CartSuccessImplCopyWith<$Res> {
  __$$CartSuccessImplCopyWithImpl(
      _$CartSuccessImpl _value, $Res Function(_$CartSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$CartSuccessImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartSuccessImpl implements CartSuccess {
  const _$CartSuccessImpl(this.productId);

  @override
  final String productId;

  @override
  String toString() {
    return 'CartState.success(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSuccessImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartSuccessImplCopyWith<_$CartSuccessImpl> get copyWith =>
      __$$CartSuccessImplCopyWithImpl<_$CartSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return success(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return success?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CartSuccess implements CartState {
  const factory CartSuccess(final String productId) = _$CartSuccessImpl;

  String get productId;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartSuccessImplCopyWith<_$CartSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartErrorImplCopyWith<$Res> {
  factory _$$CartErrorImplCopyWith(
          _$CartErrorImpl value, $Res Function(_$CartErrorImpl) then) =
      __$$CartErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId, ApiErrorModel error});
}

/// @nodoc
class __$$CartErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartErrorImpl>
    implements _$$CartErrorImplCopyWith<$Res> {
  __$$CartErrorImplCopyWithImpl(
      _$CartErrorImpl _value, $Res Function(_$CartErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? error = null,
  }) {
    return _then(_$CartErrorImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$CartErrorImpl implements CartError {
  const _$CartErrorImpl({required this.productId, required this.error});

  @override
  final String productId;
  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'CartState.error(productId: $productId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartErrorImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartErrorImplCopyWith<_$CartErrorImpl> get copyWith =>
      __$$CartErrorImplCopyWithImpl<_$CartErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return error(productId, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return error?.call(productId, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(productId, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CartError implements CartState {
  const factory CartError(
      {required final String productId,
      required final ApiErrorModel error}) = _$CartErrorImpl;

  String get productId;
  ApiErrorModel get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartErrorImplCopyWith<_$CartErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartListLoadingImplCopyWith<$Res> {
  factory _$$CartListLoadingImplCopyWith(_$CartListLoadingImpl value,
          $Res Function(_$CartListLoadingImpl) then) =
      __$$CartListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartListLoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartListLoadingImpl>
    implements _$$CartListLoadingImplCopyWith<$Res> {
  __$$CartListLoadingImplCopyWithImpl(
      _$CartListLoadingImpl _value, $Res Function(_$CartListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CartListLoadingImpl implements CartListLoading {
  const _$CartListLoadingImpl();

  @override
  String toString() {
    return 'CartState.cartLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return cartLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return cartLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) {
    if (cartLoading != null) {
      return cartLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return cartLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return cartLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (cartLoading != null) {
      return cartLoading(this);
    }
    return orElse();
  }
}

abstract class CartListLoading implements CartState {
  const factory CartListLoading() = _$CartListLoadingImpl;
}

/// @nodoc
abstract class _$$CartListSuccessImplCopyWith<$Res> {
  factory _$$CartListSuccessImplCopyWith(_$CartListSuccessImpl value,
          $Res Function(_$CartListSuccessImpl) then) =
      __$$CartListSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetCartResponseModel cartResponse});
}

/// @nodoc
class __$$CartListSuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartListSuccessImpl>
    implements _$$CartListSuccessImplCopyWith<$Res> {
  __$$CartListSuccessImplCopyWithImpl(
      _$CartListSuccessImpl _value, $Res Function(_$CartListSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartResponse = null,
  }) {
    return _then(_$CartListSuccessImpl(
      null == cartResponse
          ? _value.cartResponse
          : cartResponse // ignore: cast_nullable_to_non_nullable
              as GetCartResponseModel,
    ));
  }
}

/// @nodoc

class _$CartListSuccessImpl implements CartListSuccess {
  const _$CartListSuccessImpl(this.cartResponse);

  @override
  final GetCartResponseModel cartResponse;

  @override
  String toString() {
    return 'CartState.cartListSuccess(cartResponse: $cartResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartListSuccessImpl &&
            (identical(other.cartResponse, cartResponse) ||
                other.cartResponse == cartResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartResponse);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartListSuccessImplCopyWith<_$CartListSuccessImpl> get copyWith =>
      __$$CartListSuccessImplCopyWithImpl<_$CartListSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return cartListSuccess(cartResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return cartListSuccess?.call(cartResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) {
    if (cartListSuccess != null) {
      return cartListSuccess(cartResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return cartListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return cartListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (cartListSuccess != null) {
      return cartListSuccess(this);
    }
    return orElse();
  }
}

abstract class CartListSuccess implements CartState {
  const factory CartListSuccess(final GetCartResponseModel cartResponse) =
      _$CartListSuccessImpl;

  GetCartResponseModel get cartResponse;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartListSuccessImplCopyWith<_$CartListSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartListErrorImplCopyWith<$Res> {
  factory _$$CartListErrorImplCopyWith(
          _$CartListErrorImpl value, $Res Function(_$CartListErrorImpl) then) =
      __$$CartListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$CartListErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartListErrorImpl>
    implements _$$CartListErrorImplCopyWith<$Res> {
  __$$CartListErrorImplCopyWithImpl(
      _$CartListErrorImpl _value, $Res Function(_$CartListErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CartListErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$CartListErrorImpl implements CartListError {
  const _$CartListErrorImpl(this.error);

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'CartState.cartListError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartListErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartListErrorImplCopyWith<_$CartListErrorImpl> get copyWith =>
      __$$CartListErrorImplCopyWithImpl<_$CartListErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(String productId) success,
    required TResult Function(String productId, ApiErrorModel error) error,
    required TResult Function() cartLoading,
    required TResult Function(GetCartResponseModel cartResponse)
        cartListSuccess,
    required TResult Function(ApiErrorModel error) cartListError,
  }) {
    return cartListError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(String productId)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
    TResult? Function()? cartLoading,
    TResult? Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult? Function(ApiErrorModel error)? cartListError,
  }) {
    return cartListError?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(String productId)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    TResult Function()? cartLoading,
    TResult Function(GetCartResponseModel cartResponse)? cartListSuccess,
    TResult Function(ApiErrorModel error)? cartListError,
    required TResult orElse(),
  }) {
    if (cartListError != null) {
      return cartListError(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartSuccess value) success,
    required TResult Function(CartError value) error,
    required TResult Function(CartListLoading value) cartLoading,
    required TResult Function(CartListSuccess value) cartListSuccess,
    required TResult Function(CartListError value) cartListError,
  }) {
    return cartListError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartSuccess value)? success,
    TResult? Function(CartError value)? error,
    TResult? Function(CartListLoading value)? cartLoading,
    TResult? Function(CartListSuccess value)? cartListSuccess,
    TResult? Function(CartListError value)? cartListError,
  }) {
    return cartListError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartSuccess value)? success,
    TResult Function(CartError value)? error,
    TResult Function(CartListLoading value)? cartLoading,
    TResult Function(CartListSuccess value)? cartListSuccess,
    TResult Function(CartListError value)? cartListError,
    required TResult orElse(),
  }) {
    if (cartListError != null) {
      return cartListError(this);
    }
    return orElse();
  }
}

abstract class CartListError implements CartState {
  const factory CartListError(final ApiErrorModel error) = _$CartListErrorImpl;

  ApiErrorModel get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartListErrorImplCopyWith<_$CartListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
