// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsListState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() productsListLoading,
    required TResult Function(List<Product> productsList) productsListSuccess,
    required TResult Function(ApiErrorModel error) productsListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? productsListLoading,
    TResult? Function(List<Product> productsList)? productsListSuccess,
    TResult? Function(ApiErrorModel error)? productsListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? productsListLoading,
    TResult Function(List<Product> productsList)? productsListSuccess,
    TResult Function(ApiErrorModel error)? productsListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProductsListLoading<T> value) productsListLoading,
    required TResult Function(ProductsListSuccess<T> value) productsListSuccess,
    required TResult Function(ProductsListError<T> value) productsListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProductsListLoading<T> value)? productsListLoading,
    TResult? Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult? Function(ProductsListError<T> value)? productsListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProductsListLoading<T> value)? productsListLoading,
    TResult Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult Function(ProductsListError<T> value)? productsListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsListStateCopyWith<T, $Res> {
  factory $ProductsListStateCopyWith(ProductsListState<T> value,
          $Res Function(ProductsListState<T>) then) =
      _$ProductsListStateCopyWithImpl<T, $Res, ProductsListState<T>>;
}

/// @nodoc
class _$ProductsListStateCopyWithImpl<T, $Res,
        $Val extends ProductsListState<T>>
    implements $ProductsListStateCopyWith<T, $Res> {
  _$ProductsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsListState
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
    extends _$ProductsListStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductsListState<$T>.initial()';
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
    required TResult Function() productsListLoading,
    required TResult Function(List<Product> productsList) productsListSuccess,
    required TResult Function(ApiErrorModel error) productsListError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? productsListLoading,
    TResult? Function(List<Product> productsList)? productsListSuccess,
    TResult? Function(ApiErrorModel error)? productsListError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? productsListLoading,
    TResult Function(List<Product> productsList)? productsListSuccess,
    TResult Function(ApiErrorModel error)? productsListError,
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
    required TResult Function(ProductsListLoading<T> value) productsListLoading,
    required TResult Function(ProductsListSuccess<T> value) productsListSuccess,
    required TResult Function(ProductsListError<T> value) productsListError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProductsListLoading<T> value)? productsListLoading,
    TResult? Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult? Function(ProductsListError<T> value)? productsListError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProductsListLoading<T> value)? productsListLoading,
    TResult Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult Function(ProductsListError<T> value)? productsListError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProductsListState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ProductsListLoadingImplCopyWith<T, $Res> {
  factory _$$ProductsListLoadingImplCopyWith(_$ProductsListLoadingImpl<T> value,
          $Res Function(_$ProductsListLoadingImpl<T>) then) =
      __$$ProductsListLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ProductsListLoadingImplCopyWithImpl<T, $Res>
    extends _$ProductsListStateCopyWithImpl<T, $Res,
        _$ProductsListLoadingImpl<T>>
    implements _$$ProductsListLoadingImplCopyWith<T, $Res> {
  __$$ProductsListLoadingImplCopyWithImpl(_$ProductsListLoadingImpl<T> _value,
      $Res Function(_$ProductsListLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProductsListLoadingImpl<T> implements ProductsListLoading<T> {
  const _$ProductsListLoadingImpl();

  @override
  String toString() {
    return 'ProductsListState<$T>.productsListLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsListLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() productsListLoading,
    required TResult Function(List<Product> productsList) productsListSuccess,
    required TResult Function(ApiErrorModel error) productsListError,
  }) {
    return productsListLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? productsListLoading,
    TResult? Function(List<Product> productsList)? productsListSuccess,
    TResult? Function(ApiErrorModel error)? productsListError,
  }) {
    return productsListLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? productsListLoading,
    TResult Function(List<Product> productsList)? productsListSuccess,
    TResult Function(ApiErrorModel error)? productsListError,
    required TResult orElse(),
  }) {
    if (productsListLoading != null) {
      return productsListLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProductsListLoading<T> value) productsListLoading,
    required TResult Function(ProductsListSuccess<T> value) productsListSuccess,
    required TResult Function(ProductsListError<T> value) productsListError,
  }) {
    return productsListLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProductsListLoading<T> value)? productsListLoading,
    TResult? Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult? Function(ProductsListError<T> value)? productsListError,
  }) {
    return productsListLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProductsListLoading<T> value)? productsListLoading,
    TResult Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult Function(ProductsListError<T> value)? productsListError,
    required TResult orElse(),
  }) {
    if (productsListLoading != null) {
      return productsListLoading(this);
    }
    return orElse();
  }
}

abstract class ProductsListLoading<T> implements ProductsListState<T> {
  const factory ProductsListLoading() = _$ProductsListLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ProductsListSuccessImplCopyWith<T, $Res> {
  factory _$$ProductsListSuccessImplCopyWith(_$ProductsListSuccessImpl<T> value,
          $Res Function(_$ProductsListSuccessImpl<T>) then) =
      __$$ProductsListSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<Product> productsList});
}

/// @nodoc
class __$$ProductsListSuccessImplCopyWithImpl<T, $Res>
    extends _$ProductsListStateCopyWithImpl<T, $Res,
        _$ProductsListSuccessImpl<T>>
    implements _$$ProductsListSuccessImplCopyWith<T, $Res> {
  __$$ProductsListSuccessImplCopyWithImpl(_$ProductsListSuccessImpl<T> _value,
      $Res Function(_$ProductsListSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
  }) {
    return _then(_$ProductsListSuccessImpl<T>(
      null == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$ProductsListSuccessImpl<T> implements ProductsListSuccess<T> {
  const _$ProductsListSuccessImpl(final List<Product> productsList)
      : _productsList = productsList;

  final List<Product> _productsList;
  @override
  List<Product> get productsList {
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsList);
  }

  @override
  String toString() {
    return 'ProductsListState<$T>.productsListSuccess(productsList: $productsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsListSuccessImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productsList));

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsListSuccessImplCopyWith<T, _$ProductsListSuccessImpl<T>>
      get copyWith => __$$ProductsListSuccessImplCopyWithImpl<T,
          _$ProductsListSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() productsListLoading,
    required TResult Function(List<Product> productsList) productsListSuccess,
    required TResult Function(ApiErrorModel error) productsListError,
  }) {
    return productsListSuccess(productsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? productsListLoading,
    TResult? Function(List<Product> productsList)? productsListSuccess,
    TResult? Function(ApiErrorModel error)? productsListError,
  }) {
    return productsListSuccess?.call(productsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? productsListLoading,
    TResult Function(List<Product> productsList)? productsListSuccess,
    TResult Function(ApiErrorModel error)? productsListError,
    required TResult orElse(),
  }) {
    if (productsListSuccess != null) {
      return productsListSuccess(productsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProductsListLoading<T> value) productsListLoading,
    required TResult Function(ProductsListSuccess<T> value) productsListSuccess,
    required TResult Function(ProductsListError<T> value) productsListError,
  }) {
    return productsListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProductsListLoading<T> value)? productsListLoading,
    TResult? Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult? Function(ProductsListError<T> value)? productsListError,
  }) {
    return productsListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProductsListLoading<T> value)? productsListLoading,
    TResult Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult Function(ProductsListError<T> value)? productsListError,
    required TResult orElse(),
  }) {
    if (productsListSuccess != null) {
      return productsListSuccess(this);
    }
    return orElse();
  }
}

abstract class ProductsListSuccess<T> implements ProductsListState<T> {
  const factory ProductsListSuccess(final List<Product> productsList) =
      _$ProductsListSuccessImpl<T>;

  List<Product> get productsList;

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsListSuccessImplCopyWith<T, _$ProductsListSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsListErrorImplCopyWith<T, $Res> {
  factory _$$ProductsListErrorImplCopyWith(_$ProductsListErrorImpl<T> value,
          $Res Function(_$ProductsListErrorImpl<T>) then) =
      __$$ProductsListErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$ProductsListErrorImplCopyWithImpl<T, $Res>
    extends _$ProductsListStateCopyWithImpl<T, $Res, _$ProductsListErrorImpl<T>>
    implements _$$ProductsListErrorImplCopyWith<T, $Res> {
  __$$ProductsListErrorImplCopyWithImpl(_$ProductsListErrorImpl<T> _value,
      $Res Function(_$ProductsListErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ProductsListErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ProductsListErrorImpl<T> implements ProductsListError<T> {
  const _$ProductsListErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'ProductsListState<$T>.productsListError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsListErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsListErrorImplCopyWith<T, _$ProductsListErrorImpl<T>>
      get copyWith =>
          __$$ProductsListErrorImplCopyWithImpl<T, _$ProductsListErrorImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() productsListLoading,
    required TResult Function(List<Product> productsList) productsListSuccess,
    required TResult Function(ApiErrorModel error) productsListError,
  }) {
    return productsListError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? productsListLoading,
    TResult? Function(List<Product> productsList)? productsListSuccess,
    TResult? Function(ApiErrorModel error)? productsListError,
  }) {
    return productsListError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? productsListLoading,
    TResult Function(List<Product> productsList)? productsListSuccess,
    TResult Function(ApiErrorModel error)? productsListError,
    required TResult orElse(),
  }) {
    if (productsListError != null) {
      return productsListError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProductsListLoading<T> value) productsListLoading,
    required TResult Function(ProductsListSuccess<T> value) productsListSuccess,
    required TResult Function(ProductsListError<T> value) productsListError,
  }) {
    return productsListError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProductsListLoading<T> value)? productsListLoading,
    TResult? Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult? Function(ProductsListError<T> value)? productsListError,
  }) {
    return productsListError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProductsListLoading<T> value)? productsListLoading,
    TResult Function(ProductsListSuccess<T> value)? productsListSuccess,
    TResult Function(ProductsListError<T> value)? productsListError,
    required TResult orElse(),
  }) {
    if (productsListError != null) {
      return productsListError(this);
    }
    return orElse();
  }
}

abstract class ProductsListError<T> implements ProductsListState<T> {
  const factory ProductsListError({required final ApiErrorModel error}) =
      _$ProductsListErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsListErrorImplCopyWith<T, _$ProductsListErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
