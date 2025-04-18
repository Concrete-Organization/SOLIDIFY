// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(ProductModel product) success,
    required TResult Function(String productId, ApiErrorModel error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(ProductModel product)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(ProductModel product)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DetailsLoading value) loading,
    required TResult Function(DetailsSuccess value) success,
    required TResult Function(DetailsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DetailsLoading value)? loading,
    TResult? Function(DetailsSuccess value)? success,
    TResult? Function(DetailsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DetailsLoading value)? loading,
    TResult Function(DetailsSuccess value)? success,
    TResult Function(DetailsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetailsState
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
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductDetailsState.initial()';
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
    required TResult Function(ProductModel product) success,
    required TResult Function(String productId, ApiErrorModel error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(ProductModel product)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(ProductModel product)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
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
    required TResult Function(DetailsLoading value) loading,
    required TResult Function(DetailsSuccess value) success,
    required TResult Function(DetailsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DetailsLoading value)? loading,
    TResult? Function(DetailsSuccess value)? success,
    TResult? Function(DetailsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DetailsLoading value)? loading,
    TResult Function(DetailsSuccess value)? success,
    TResult Function(DetailsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductDetailsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DetailsLoadingImplCopyWith<$Res> {
  factory _$$DetailsLoadingImplCopyWith(_$DetailsLoadingImpl value,
          $Res Function(_$DetailsLoadingImpl) then) =
      __$$DetailsLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$DetailsLoadingImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$DetailsLoadingImpl>
    implements _$$DetailsLoadingImplCopyWith<$Res> {
  __$$DetailsLoadingImplCopyWithImpl(
      _$DetailsLoadingImpl _value, $Res Function(_$DetailsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$DetailsLoadingImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailsLoadingImpl implements DetailsLoading {
  const _$DetailsLoadingImpl(this.productId);

  @override
  final String productId;

  @override
  String toString() {
    return 'ProductDetailsState.loading(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsLoadingImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsLoadingImplCopyWith<_$DetailsLoadingImpl> get copyWith =>
      __$$DetailsLoadingImplCopyWithImpl<_$DetailsLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(ProductModel product) success,
    required TResult Function(String productId, ApiErrorModel error) error,
  }) {
    return loading(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(ProductModel product)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
  }) {
    return loading?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(ProductModel product)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
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
    required TResult Function(DetailsLoading value) loading,
    required TResult Function(DetailsSuccess value) success,
    required TResult Function(DetailsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DetailsLoading value)? loading,
    TResult? Function(DetailsSuccess value)? success,
    TResult? Function(DetailsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DetailsLoading value)? loading,
    TResult Function(DetailsSuccess value)? success,
    TResult Function(DetailsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DetailsLoading implements ProductDetailsState {
  const factory DetailsLoading(final String productId) = _$DetailsLoadingImpl;

  String get productId;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailsLoadingImplCopyWith<_$DetailsLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailsSuccessImplCopyWith<$Res> {
  factory _$$DetailsSuccessImplCopyWith(_$DetailsSuccessImpl value,
          $Res Function(_$DetailsSuccessImpl) then) =
      __$$DetailsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductModel product});
}

/// @nodoc
class __$$DetailsSuccessImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$DetailsSuccessImpl>
    implements _$$DetailsSuccessImplCopyWith<$Res> {
  __$$DetailsSuccessImplCopyWithImpl(
      _$DetailsSuccessImpl _value, $Res Function(_$DetailsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$DetailsSuccessImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc

class _$DetailsSuccessImpl implements DetailsSuccess {
  const _$DetailsSuccessImpl(this.product);

  @override
  final ProductModel product;

  @override
  String toString() {
    return 'ProductDetailsState.success(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsSuccessImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsSuccessImplCopyWith<_$DetailsSuccessImpl> get copyWith =>
      __$$DetailsSuccessImplCopyWithImpl<_$DetailsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(ProductModel product) success,
    required TResult Function(String productId, ApiErrorModel error) error,
  }) {
    return success(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(ProductModel product)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
  }) {
    return success?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(ProductModel product)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DetailsLoading value) loading,
    required TResult Function(DetailsSuccess value) success,
    required TResult Function(DetailsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DetailsLoading value)? loading,
    TResult? Function(DetailsSuccess value)? success,
    TResult? Function(DetailsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DetailsLoading value)? loading,
    TResult Function(DetailsSuccess value)? success,
    TResult Function(DetailsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DetailsSuccess implements ProductDetailsState {
  const factory DetailsSuccess(final ProductModel product) =
      _$DetailsSuccessImpl;

  ProductModel get product;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailsSuccessImplCopyWith<_$DetailsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailsErrorImplCopyWith<$Res> {
  factory _$$DetailsErrorImplCopyWith(
          _$DetailsErrorImpl value, $Res Function(_$DetailsErrorImpl) then) =
      __$$DetailsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId, ApiErrorModel error});
}

/// @nodoc
class __$$DetailsErrorImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$DetailsErrorImpl>
    implements _$$DetailsErrorImplCopyWith<$Res> {
  __$$DetailsErrorImplCopyWithImpl(
      _$DetailsErrorImpl _value, $Res Function(_$DetailsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? error = null,
  }) {
    return _then(_$DetailsErrorImpl(
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

class _$DetailsErrorImpl implements DetailsError {
  const _$DetailsErrorImpl({required this.productId, required this.error});

  @override
  final String productId;
  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'ProductDetailsState.error(productId: $productId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsErrorImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, error);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsErrorImplCopyWith<_$DetailsErrorImpl> get copyWith =>
      __$$DetailsErrorImplCopyWithImpl<_$DetailsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String productId) loading,
    required TResult Function(ProductModel product) success,
    required TResult Function(String productId, ApiErrorModel error) error,
  }) {
    return error(productId, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String productId)? loading,
    TResult? Function(ProductModel product)? success,
    TResult? Function(String productId, ApiErrorModel error)? error,
  }) {
    return error?.call(productId, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String productId)? loading,
    TResult Function(ProductModel product)? success,
    TResult Function(String productId, ApiErrorModel error)? error,
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
    required TResult Function(DetailsLoading value) loading,
    required TResult Function(DetailsSuccess value) success,
    required TResult Function(DetailsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DetailsLoading value)? loading,
    TResult? Function(DetailsSuccess value)? success,
    TResult? Function(DetailsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DetailsLoading value)? loading,
    TResult Function(DetailsSuccess value)? success,
    TResult Function(DetailsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DetailsError implements ProductDetailsState {
  const factory DetailsError(
      {required final String productId,
      required final ApiErrorModel error}) = _$DetailsErrorImpl;

  String get productId;
  ApiErrorModel get error;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailsErrorImplCopyWith<_$DetailsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
