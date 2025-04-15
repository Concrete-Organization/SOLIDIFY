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
mixin _$ProductsListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> products) loading,
    required TResult Function(List<Product> products) marketplaceSuccess,
    required TResult Function(List<Product> products, bool hasReachedMax)
    bestSellersSuccess,
    required TResult Function(ApiErrorModel error) error,
    required TResult Function(List<Product> products) searchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> products)? loading,
    TResult? Function(List<Product> products)? marketplaceSuccess,
    TResult? Function(List<Product> products, bool hasReachedMax)?
    bestSellersSuccess,
    TResult? Function(ApiErrorModel error)? error,
    TResult? Function(List<Product> products)? searchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
  TResult Function()? initial,
  TResult Function(List<Product> products)? loading,
  TResult Function(List<Product> products)? marketplaceSuccess,
  TResult Function(List<Product> products, bool hasReachedMax)?
  bestSellersSuccess,
  TResult Function(ApiErrorModel error)? error,
  TResult Function(List<Product> products)? searchSuccess,
  required TResult orElse(),
}) =>
throw _privateConstructorUsedError;
@optionalTypeArgs
TResult map<TResult extends Object?>({
  required TResult Function(_Initial value) initial,
  required TResult Function(ProductsListLoading value) loading,
  required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
  required TResult Function(BestSellersSuccess value) bestSellersSuccess,
  required TResult Function(ProductsListError value) error,
  required TResult Function(SearchSuccess value) searchSuccess,
}) =>
    throw _privateConstructorUsedError;
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
  TResult? Function(_Initial value)? initial,
  TResult? Function(ProductsListLoading value)? loading,
  TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
  TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
  TResult? Function(ProductsListError value)? error,
  TResult? Function(SearchSuccess value)? searchSuccess,
}) =>
    throw _privateConstructorUsedError;
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsListStateCopyWith<$Res> {
factory $ProductsListStateCopyWith(
ProductsListState value, $Res Function(ProductsListState) then) =
_$ProductsListStateCopyWithImpl<$Res, ProductsListState>;
}

/// @nodoc
class _$ProductsListStateCopyWithImpl<$Res, $Val extends ProductsListState>
implements $ProductsListStateCopyWith<$Res> {
_$ProductsListStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
final $Val _value;
// ignore: unused_field
final $Res Function($Val) _then;

/// Create a copy of ProductsListState
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
extends _$ProductsListStateCopyWithImpl<$Res, _$InitialImpl>
implements _$$InitialImplCopyWith<$Res> {
__$$InitialImplCopyWithImpl(
_$InitialImpl _value, $Res Function(_$InitialImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
const _$InitialImpl();

@override
String toString() {
return 'ProductsListState.initial()';
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
required TResult Function(List<Product> products) loading,
required TResult Function(List<Product> products) marketplaceSuccess,
required TResult Function(List<Product> products, bool hasReachedMax)
bestSellersSuccess,
required TResult Function(ApiErrorModel error) error,
required TResult Function(List<Product> products) searchSuccess,
}) {
return initial();
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function(List<Product> products)? loading,
TResult? Function(List<Product> products)? marketplaceSuccess,
TResult? Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult? Function(ApiErrorModel error)? error,
TResult? Function(List<Product> products)? searchSuccess,
}) {
return initial?.call();
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function(List<Product> products)? loading,
TResult Function(List<Product> products)? marketplaceSuccess,
TResult Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult Function(ApiErrorModel error)? error,
TResult Function(List<Product> products)? searchSuccess,
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
required TResult Function(ProductsListLoading value) loading,
required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
required TResult Function(BestSellersSuccess value) bestSellersSuccess,
required TResult Function(ProductsListError value) error,
required TResult Function(SearchSuccess value) searchSuccess,
}) {
return initial(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(ProductsListLoading value)? loading,
TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
TResult? Function(ProductsListError value)? error,
TResult? Function(SearchSuccess value)? searchSuccess,
}) {
return initial?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) {
if (initial != null) {
return initial(this);
}
return orElse();
}
}

abstract class _Initial implements ProductsListState {
const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProductsListLoadingImplCopyWith<$Res> {
factory _$$ProductsListLoadingImplCopyWith(_$ProductsListLoadingImpl value,
$Res Function(_$ProductsListLoadingImpl) then) =
__$$ProductsListLoadingImplCopyWithImpl<$Res>;
@useResult
$Res call({List<Product> products});
}

/// @nodoc
class __$$ProductsListLoadingImplCopyWithImpl<$Res>
extends _$ProductsListStateCopyWithImpl<$Res, _$ProductsListLoadingImpl>
implements _$$ProductsListLoadingImplCopyWith<$Res> {
__$$ProductsListLoadingImplCopyWithImpl(_$ProductsListLoadingImpl _value,
$Res Function(_$ProductsListLoadingImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? products = null,
}) {
return _then(_$ProductsListLoadingImpl(
null == products
? _value._products
    : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
));
}
}

/// @nodoc

class _$ProductsListLoadingImpl implements ProductsListLoading {
const _$ProductsListLoadingImpl(final List<Product> products)
    : _products = products;

final List<Product> _products;
@override
List<Product> get products {
if (_products is EqualUnmodifiableListView) return _products;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_products);
}

@override
String toString() {
return 'ProductsListState.loading(products: $products)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$ProductsListLoadingImpl &&
const DeepCollectionEquality().equals(other._products, _products));
}

@override
int get hashCode =>
Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ProductsListLoadingImplCopyWith<_$ProductsListLoadingImpl> get copyWith =>
__$$ProductsListLoadingImplCopyWithImpl<_$ProductsListLoadingImpl>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function(List<Product> products) loading,
required TResult Function(List<Product> products) marketplaceSuccess,
required TResult Function(List<Product> products, bool hasReachedMax)
bestSellersSuccess,
required TResult Function(ApiErrorModel error) error,
required TResult Function(List<Product> products) searchSuccess,
}) {
return loading(products);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function(List<Product> products)? loading,
TResult? Function(List<Product> products)? marketplaceSuccess,
TResult? Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult? Function(ApiErrorModel error)? error,
TResult? Function(List<Product> products)? searchSuccess,
}) {
return loading?.call(products);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function(List<Product> products)? loading,
TResult Function(List<Product> products)? marketplaceSuccess,
TResult Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult Function(ApiErrorModel error)? error,
TResult Function(List<Product> products)? searchSuccess,
required TResult orElse(),
}) {
if (loading != null) {
return loading(products);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(ProductsListLoading value) loading,
required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
required TResult Function(BestSellersSuccess value) bestSellersSuccess,
required TResult Function(ProductsListError value) error,
required TResult Function(SearchSuccess value) searchSuccess,
}) {
return loading(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(ProductsListLoading value)? loading,
TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
TResult? Function(ProductsListError value)? error,
TResult? Function(SearchSuccess value)? searchSuccess,
}) {
return loading?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) {
if (loading != null) {
return loading(this);
}
return orElse();
}
}

abstract class ProductsListLoading implements ProductsListState {
const factory ProductsListLoading(final List<Product> products) =
_$ProductsListLoadingImpl;

List<Product> get products;

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$ProductsListLoadingImplCopyWith<_$ProductsListLoadingImpl> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarketplaceSuccessImplCopyWith<$Res> {
factory _$$MarketplaceSuccessImplCopyWith(_$MarketplaceSuccessImpl value,
$Res Function(_$MarketplaceSuccessImpl) then) =
__$$MarketplaceSuccessImplCopyWithImpl<$Res>;
@useResult
$Res call({List<Product> products});
}

/// @nodoc
class __$$MarketplaceSuccessImplCopyWithImpl<$Res>
extends _$ProductsListStateCopyWithImpl<$Res, _$MarketplaceSuccessImpl>
implements _$$MarketplaceSuccessImplCopyWith<$Res> {
__$$MarketplaceSuccessImplCopyWithImpl(_$MarketplaceSuccessImpl _value,
$Res Function(_$MarketplaceSuccessImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? products = null,
}) {
return _then(_$MarketplaceSuccessImpl(
null == products
? _value._products
    : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
));
}
}

/// @nodoc

class _$MarketplaceSuccessImpl implements MarketplaceSuccess {
const _$MarketplaceSuccessImpl(final List<Product> products)
    : _products = products;

final List<Product> _products;
@override
List<Product> get products {
if (_products is EqualUnmodifiableListView) return _products;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_products);
}

@override
String toString() {
return 'ProductsListState.marketplaceSuccess(products: $products)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$MarketplaceSuccessImpl &&
const DeepCollectionEquality().equals(other._products, _products));
}

@override
int get hashCode =>
Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$MarketplaceSuccessImplCopyWith<_$MarketplaceSuccessImpl> get copyWith =>
__$$MarketplaceSuccessImplCopyWithImpl<_$MarketplaceSuccessImpl>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function(List<Product> products) loading,
required TResult Function(List<Product> products) marketplaceSuccess,
required TResult Function(List<Product> products, bool hasReachedMax)
bestSellersSuccess,
required TResult Function(ApiErrorModel error) error,
required TResult Function(List<Product> products) searchSuccess,
}) {
return marketplaceSuccess(products);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function(List<Product> products)? loading,
TResult? Function(List<Product> products)? marketplaceSuccess,
TResult? Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult? Function(ApiErrorModel error)? error,
TResult? Function(List<Product> products)? searchSuccess,
}) {
return marketplaceSuccess?.call(products);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function(List<Product> products)? loading,
TResult Function(List<Product> products)? marketplaceSuccess,
TResult Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult Function(ApiErrorModel error)? error,
TResult Function(List<Product> products)? searchSuccess,
required TResult orElse(),
}) {
if (marketplaceSuccess != null) {
return marketplaceSuccess(products);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(ProductsListLoading value) loading,
required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
required TResult Function(BestSellersSuccess value) bestSellersSuccess,
required TResult Function(ProductsListError value) error,
required TResult Function(SearchSuccess value) searchSuccess,
}) {
return marketplaceSuccess(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(ProductsListLoading value)? loading,
TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
TResult? Function(ProductsListError value)? error,
TResult? Function(SearchSuccess value)? searchSuccess,
}) {
return marketplaceSuccess?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) {
if (marketplaceSuccess != null) {
return marketplaceSuccess(this);
}
return orElse();
}
}

abstract class MarketplaceSuccess implements ProductsListState {
const factory MarketplaceSuccess(final List<Product> products) =
_$MarketplaceSuccessImpl;

List<Product> get products;

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$MarketplaceSuccessImplCopyWith<_$MarketplaceSuccessImpl> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BestSellersSuccessImplCopyWith<$Res> {
factory _$$BestSellersSuccessImplCopyWith(_$BestSellersSuccessImpl value,
$Res Function(_$BestSellersSuccessImpl) then) =
__$$BestSellersSuccessImplCopyWithImpl<$Res>;
@useResult
$Res call({List<Product> products, bool hasReachedMax});
}

/// @nodoc
class __$$BestSellersSuccessImplCopyWithImpl<$Res>
extends _$ProductsListStateCopyWithImpl<$Res, _$BestSellersSuccessImpl>
implements _$$BestSellersSuccessImplCopyWith<$Res> {
__$$BestSellersSuccessImplCopyWithImpl(_$BestSellersSuccessImpl _value,
$Res Function(_$BestSellersSuccessImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? products = null,
Object? hasReachedMax = null,
}) {
return _then(_$BestSellersSuccessImpl(
null == products
? _value._products
    : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
null == hasReachedMax
? _value.hasReachedMax
    : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
));
}
}

/// @nodoc

class _$BestSellersSuccessImpl implements BestSellersSuccess {
const _$BestSellersSuccessImpl(
final List<Product> products, this.hasReachedMax)
    : _products = products;

final List<Product> _products;
@override
List<Product> get products {
if (_products is EqualUnmodifiableListView) return _products;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_products);
}

@override
final bool hasReachedMax;

@override
String toString() {
return 'ProductsListState.bestSellersSuccess(products: $products, hasReachedMax: $hasReachedMax)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$BestSellersSuccessImpl &&
const DeepCollectionEquality().equals(other._products, _products) &&
(identical(other.hasReachedMax, hasReachedMax) ||
other.hasReachedMax == hasReachedMax));
}

@override
int get hashCode => Object.hash(runtimeType,
const DeepCollectionEquality().hash(_products), hasReachedMax);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$BestSellersSuccessImplCopyWith<_$BestSellersSuccessImpl> get copyWith =>
__$$BestSellersSuccessImplCopyWithImpl<_$BestSellersSuccessImpl>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function(List<Product> products) loading,
required TResult Function(List<Product> products) marketplaceSuccess,
required TResult Function(List<Product> products, bool hasReachedMax)
bestSellersSuccess,
required TResult Function(ApiErrorModel error) error,
required TResult Function(List<Product> products) searchSuccess,
}) {
return bestSellersSuccess(products, hasReachedMax);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function(List<Product> products)? loading,
TResult? Function(List<Product> products)? marketplaceSuccess,
TResult? Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult? Function(ApiErrorModel error)? error,
TResult? Function(List<Product> products)? searchSuccess,
}) {
return bestSellersSuccess?.call(products, hasReachedMax);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function(List<Product> products)? loading,
TResult Function(List<Product> products)? marketplaceSuccess,
TResult Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult Function(ApiErrorModel error)? error,
TResult Function(List<Product> products)? searchSuccess,
required TResult orElse(),
}) {
if (bestSellersSuccess != null) {
return bestSellersSuccess(products, hasReachedMax);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(ProductsListLoading value) loading,
required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
required TResult Function(BestSellersSuccess value) bestSellersSuccess,
required TResult Function(ProductsListError value) error,
required TResult Function(SearchSuccess value) searchSuccess,
}) {
return bestSellersSuccess(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(ProductsListLoading value)? loading,
TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
TResult? Function(ProductsListError value)? error,
TResult? Function(SearchSuccess value)? searchSuccess,
}) {
return bestSellersSuccess?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) {
if (bestSellersSuccess != null) {
return bestSellersSuccess(this);
}
return orElse();
}
}

abstract class BestSellersSuccess implements ProductsListState {
const factory BestSellersSuccess(
final List<Product> products, final bool hasReachedMax) =
_$BestSellersSuccessImpl;

List<Product> get products;
bool get hasReachedMax;

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$BestSellersSuccessImplCopyWith<_$BestSellersSuccessImpl> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsListErrorImplCopyWith<$Res> {
factory _$$ProductsListErrorImplCopyWith(_$ProductsListErrorImpl value,
$Res Function(_$ProductsListErrorImpl) then) =
__$$ProductsListErrorImplCopyWithImpl<$Res>;
@useResult
$Res call({ApiErrorModel error});
}

/// @nodoc
class __$$ProductsListErrorImplCopyWithImpl<$Res>
extends _$ProductsListStateCopyWithImpl<$Res, _$ProductsListErrorImpl>
implements _$$ProductsListErrorImplCopyWith<$Res> {
__$$ProductsListErrorImplCopyWithImpl(_$ProductsListErrorImpl _value,
$Res Function(_$ProductsListErrorImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? error = null,
}) {
return _then(_$ProductsListErrorImpl(
null == error
? _value.error
    : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
));
}
}

/// @nodoc

class _$ProductsListErrorImpl implements ProductsListError {
const _$ProductsListErrorImpl(this.error);

@override
final ApiErrorModel error;

@override
String toString() {
return 'ProductsListState.error(error: $error)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$ProductsListErrorImpl &&
(identical(other.error, error) || other.error == error));
}

@override
int get hashCode => Object.hash(runtimeType, error);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ProductsListErrorImplCopyWith<_$ProductsListErrorImpl> get copyWith =>
__$$ProductsListErrorImplCopyWithImpl<_$ProductsListErrorImpl>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function(List<Product> products) loading,
required TResult Function(List<Product> products) marketplaceSuccess,
required TResult Function(List<Product> products, bool hasReachedMax)
bestSellersSuccess,
required TResult Function(ApiErrorModel error) error,
required TResult Function(List<Product> products) searchSuccess,
}) {
return error(this.error);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function(List<Product> products)? loading,
TResult? Function(List<Product> products)? marketplaceSuccess,
TResult? Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult? Function(ApiErrorModel error)? error,
TResult? Function(List<Product> products)? searchSuccess,
}) {
return error?.call(this.error);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function(List<Product> products)? loading,
TResult Function(List<Product> products)? marketplaceSuccess,
TResult Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult Function(ApiErrorModel error)? error,
TResult Function(List<Product> products)? searchSuccess,
required TResult orElse(),
}) {
if (error != null) {
return error(this.error);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(ProductsListLoading value) loading,
required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
required TResult Function(BestSellersSuccess value) bestSellersSuccess,
required TResult Function(ProductsListError value) error,
required TResult Function(SearchSuccess value) searchSuccess,
}) {
return error(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(ProductsListLoading value)? loading,
TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
TResult? Function(ProductsListError value)? error,
TResult? Function(SearchSuccess value)? searchSuccess,
}) {
return error?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) {
if (error != null) {
return error(this);
}
return orElse();
}
}

abstract class ProductsListError implements ProductsListState {
const factory ProductsListError(final ApiErrorModel error) =
_$ProductsListErrorImpl;

ApiErrorModel get error;

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$ProductsListErrorImplCopyWith<_$ProductsListErrorImpl> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSuccessImplCopyWith<$Res> {
factory _$$SearchSuccessImplCopyWith(
_$SearchSuccessImpl value, $Res Function(_$SearchSuccessImpl) then) =
__$$SearchSuccessImplCopyWithImpl<$Res>;
@useResult
$Res call({List<Product> products});
}

/// @nodoc
class __$$SearchSuccessImplCopyWithImpl<$Res>
extends _$ProductsListStateCopyWithImpl<$Res, _$SearchSuccessImpl>
implements _$$SearchSuccessImplCopyWith<$Res> {
__$$SearchSuccessImplCopyWithImpl(
_$SearchSuccessImpl _value, $Res Function(_$SearchSuccessImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? products = null,
}) {
return _then(_$SearchSuccessImpl(
null == products
? _value._products
    : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
));
}
}

/// @nodoc

class _$SearchSuccessImpl implements SearchSuccess {
const _$SearchSuccessImpl(final List<Product> products)
    : _products = products;

final List<Product> _products;
@override
List<Product> get products {
if (_products is EqualUnmodifiableListView) return _products;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_products);
}

@override
String toString() {
return 'ProductsListState.searchSuccess(products: $products)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$SearchSuccessImpl &&
const DeepCollectionEquality().equals(other._products, _products));
}

@override
int get hashCode =>
Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$SearchSuccessImplCopyWith<_$SearchSuccessImpl> get copyWith =>
__$$SearchSuccessImplCopyWithImpl<_$SearchSuccessImpl>(this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function(List<Product> products) loading,
required TResult Function(List<Product> products) marketplaceSuccess,
required TResult Function(List<Product> products, bool hasReachedMax)
bestSellersSuccess,
required TResult Function(ApiErrorModel error) error,
required TResult Function(List<Product> products) searchSuccess,
}) {
return searchSuccess(products);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function(List<Product> products)? loading,
TResult? Function(List<Product> products)? marketplaceSuccess,
TResult? Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult? Function(ApiErrorModel error)? error,
TResult? Function(List<Product> products)? searchSuccess,
}) {
return searchSuccess?.call(products);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function(List<Product> products)? loading,
TResult Function(List<Product> products)? marketplaceSuccess,
TResult Function(List<Product> products, bool hasReachedMax)?
bestSellersSuccess,
TResult Function(ApiErrorModel error)? error,
TResult Function(List<Product> products)? searchSuccess,
required TResult orElse(),
}) {
if (searchSuccess != null) {
return searchSuccess(products);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(ProductsListLoading value) loading,
required TResult Function(MarketplaceSuccess value) marketplaceSuccess,
required TResult Function(BestSellersSuccess value) bestSellersSuccess,
required TResult Function(ProductsListError value) error,
required TResult Function(SearchSuccess value) searchSuccess,
}) {
return searchSuccess(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(ProductsListLoading value)? loading,
TResult? Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult? Function(BestSellersSuccess value)? bestSellersSuccess,
TResult? Function(ProductsListError value)? error,
TResult? Function(SearchSuccess value)? searchSuccess,
}) {
return searchSuccess?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(ProductsListLoading value)? loading,
TResult Function(MarketplaceSuccess value)? marketplaceSuccess,
TResult Function(BestSellersSuccess value)? bestSellersSuccess,
TResult Function(ProductsListError value)? error,
TResult Function(SearchSuccess value)? searchSuccess,
required TResult orElse(),
}) {
if (searchSuccess != null) {
return searchSuccess(this);
}
return orElse();
}
}

abstract class SearchSuccess implements ProductsListState {
const factory SearchSuccess(final List<Product> products) =
_$SearchSuccessImpl;

List<Product> get products;

/// Create a copy of ProductsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$SearchSuccessImplCopyWith<_$SearchSuccessImpl> get copyWith =>
throw _privateConstructorUsedError;
}