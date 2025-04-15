// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductCategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(GetProductsByCategoryResponseModel response,
        List<String> cachedProductIds)
    categorySuccess,
    required TResult Function(ApiErrorModel error) categoryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(GetProductsByCategoryResponseModel response,
        List<String> cachedProductIds)?
    categorySuccess,
    TResult? Function(ApiErrorModel error)? categoryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
  TResult Function()? initial,
  TResult Function()? categoryLoading,
  TResult Function(GetProductsByCategoryResponseModel response,
  List<String> cachedProductIds)?
  categorySuccess,
  TResult Function(ApiErrorModel error)? categoryError,
  required TResult orElse(),
}) =>
throw _privateConstructorUsedError;
@optionalTypeArgs
TResult map<TResult extends Object?>({
  required TResult Function(_Initial value) initial,
  required TResult Function(CategoryLoading value) categoryLoading,
  required TResult Function(CategorySuccess value) categorySuccess,
  required TResult Function(CategoryError value) categoryError,
}) =>
    throw _privateConstructorUsedError;
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
  TResult? Function(_Initial value)? initial,
  TResult? Function(CategoryLoading value)? categoryLoading,
  TResult? Function(CategorySuccess value)? categorySuccess,
  TResult? Function(CategoryError value)? categoryError,
}) =>
    throw _privateConstructorUsedError;
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(CategoryLoading value)? categoryLoading,
TResult Function(CategorySuccess value)? categorySuccess,
TResult Function(CategoryError value)? categoryError,
required TResult orElse(),
}) =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryStateCopyWith<$Res> {
factory $ProductCategoryStateCopyWith(ProductCategoryState value,
$Res Function(ProductCategoryState) then) =
_$ProductCategoryStateCopyWithImpl<$Res, ProductCategoryState>;
}

/// @nodoc
class _$ProductCategoryStateCopyWithImpl<$Res,
$Val extends ProductCategoryState>
implements $ProductCategoryStateCopyWith<$Res> {
_$ProductCategoryStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
final $Val _value;
// ignore: unused_field
final $Res Function($Val) _then;

/// Create a copy of ProductCategoryState
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
extends _$ProductCategoryStateCopyWithImpl<$Res, _$InitialImpl>
implements _$$InitialImplCopyWith<$Res> {
__$$InitialImplCopyWithImpl(
_$InitialImpl _value, $Res Function(_$InitialImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
const _$InitialImpl();

@override
String toString() {
return 'ProductCategoryState.initial()';
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
required TResult Function() categoryLoading,
required TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)
categorySuccess,
required TResult Function(ApiErrorModel error) categoryError,
}) {
return initial();
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? categoryLoading,
TResult? Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult? Function(ApiErrorModel error)? categoryError,
}) {
return initial?.call();
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? categoryLoading,
TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult Function(ApiErrorModel error)? categoryError,
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
required TResult Function(CategoryLoading value) categoryLoading,
required TResult Function(CategorySuccess value) categorySuccess,
required TResult Function(CategoryError value) categoryError,
}) {
return initial(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(CategoryLoading value)? categoryLoading,
TResult? Function(CategorySuccess value)? categorySuccess,
TResult? Function(CategoryError value)? categoryError,
}) {
return initial?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(CategoryLoading value)? categoryLoading,
TResult Function(CategorySuccess value)? categorySuccess,
TResult Function(CategoryError value)? categoryError,
required TResult orElse(),
}) {
if (initial != null) {
return initial(this);
}
return orElse();
}
}

abstract class _Initial implements ProductCategoryState {
const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CategoryLoadingImplCopyWith<$Res> {
factory _$$CategoryLoadingImplCopyWith(_$CategoryLoadingImpl value,
$Res Function(_$CategoryLoadingImpl) then) =
__$$CategoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryLoadingImplCopyWithImpl<$Res>
extends _$ProductCategoryStateCopyWithImpl<$Res, _$CategoryLoadingImpl>
implements _$$CategoryLoadingImplCopyWith<$Res> {
__$$CategoryLoadingImplCopyWithImpl(
_$CategoryLoadingImpl _value, $Res Function(_$CategoryLoadingImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoryLoadingImpl implements CategoryLoading {
const _$CategoryLoadingImpl();

@override
String toString() {
return 'ProductCategoryState.categoryLoading()';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType && other is _$CategoryLoadingImpl);
}

@override
int get hashCode => runtimeType.hashCode;

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() categoryLoading,
required TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)
categorySuccess,
required TResult Function(ApiErrorModel error) categoryError,
}) {
return categoryLoading();
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? categoryLoading,
TResult? Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult? Function(ApiErrorModel error)? categoryError,
}) {
return categoryLoading?.call();
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? categoryLoading,
TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult Function(ApiErrorModel error)? categoryError,
required TResult orElse(),
}) {
if (categoryLoading != null) {
return categoryLoading();
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(CategoryLoading value) categoryLoading,
required TResult Function(CategorySuccess value) categorySuccess,
required TResult Function(CategoryError value) categoryError,
}) {
return categoryLoading(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(CategoryLoading value)? categoryLoading,
TResult? Function(CategorySuccess value)? categorySuccess,
TResult? Function(CategoryError value)? categoryError,
}) {
return categoryLoading?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(CategoryLoading value)? categoryLoading,
TResult Function(CategorySuccess value)? categorySuccess,
TResult Function(CategoryError value)? categoryError,
required TResult orElse(),
}) {
if (categoryLoading != null) {
return categoryLoading(this);
}
return orElse();
}
}

abstract class CategoryLoading implements ProductCategoryState {
const factory CategoryLoading() = _$CategoryLoadingImpl;
}

/// @nodoc
abstract class _$$CategorySuccessImplCopyWith<$Res> {
factory _$$CategorySuccessImplCopyWith(_$CategorySuccessImpl value,
$Res Function(_$CategorySuccessImpl) then) =
__$$CategorySuccessImplCopyWithImpl<$Res>;
@useResult
$Res call(
{GetProductsByCategoryResponseModel response,
List<String> cachedProductIds});
}

/// @nodoc
class __$$CategorySuccessImplCopyWithImpl<$Res>
extends _$ProductCategoryStateCopyWithImpl<$Res, _$CategorySuccessImpl>
implements _$$CategorySuccessImplCopyWith<$Res> {
__$$CategorySuccessImplCopyWithImpl(
_$CategorySuccessImpl _value, $Res Function(_$CategorySuccessImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? response = null,
Object? cachedProductIds = null,
}) {
return _then(_$CategorySuccessImpl(
null == response
? _value.response
    : response // ignore: cast_nullable_to_non_nullable
as GetProductsByCategoryResponseModel,
null == cachedProductIds
? _value._cachedProductIds
    : cachedProductIds // ignore: cast_nullable_to_non_nullable
as List<String>,
));
}
}

/// @nodoc

class _$CategorySuccessImpl implements CategorySuccess {
const _$CategorySuccessImpl(
this.response, final List<String> cachedProductIds)
    : _cachedProductIds = cachedProductIds;

@override
final GetProductsByCategoryResponseModel response;
final List<String> _cachedProductIds;
@override
List<String> get cachedProductIds {
if (_cachedProductIds is EqualUnmodifiableListView)
return _cachedProductIds;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_cachedProductIds);
}

@override
String toString() {
return 'ProductCategoryState.categorySuccess(response: $response, cachedProductIds: $cachedProductIds)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$CategorySuccessImpl &&
(identical(other.response, response) ||
other.response == response) &&
const DeepCollectionEquality()
    .equals(other._cachedProductIds, _cachedProductIds));
}

@override
int get hashCode => Object.hash(runtimeType, response,
const DeepCollectionEquality().hash(_cachedProductIds));

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$CategorySuccessImplCopyWith<_$CategorySuccessImpl> get copyWith =>
__$$CategorySuccessImplCopyWithImpl<_$CategorySuccessImpl>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() categoryLoading,
required TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)
categorySuccess,
required TResult Function(ApiErrorModel error) categoryError,
}) {
return categorySuccess(response, cachedProductIds);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? categoryLoading,
TResult? Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult? Function(ApiErrorModel error)? categoryError,
}) {
return categorySuccess?.call(response, cachedProductIds);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? categoryLoading,
TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult Function(ApiErrorModel error)? categoryError,
required TResult orElse(),
}) {
if (categorySuccess != null) {
return categorySuccess(response, cachedProductIds);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(CategoryLoading value) categoryLoading,
required TResult Function(CategorySuccess value) categorySuccess,
required TResult Function(CategoryError value) categoryError,
}) {
return categorySuccess(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(CategoryLoading value)? categoryLoading,
TResult? Function(CategorySuccess value)? categorySuccess,
TResult? Function(CategoryError value)? categoryError,
}) {
return categorySuccess?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(CategoryLoading value)? categoryLoading,
TResult Function(CategorySuccess value)? categorySuccess,
TResult Function(CategoryError value)? categoryError,
required TResult orElse(),
}) {
if (categorySuccess != null) {
return categorySuccess(this);
}
return orElse();
}
}

abstract class CategorySuccess implements ProductCategoryState {
const factory CategorySuccess(
final GetProductsByCategoryResponseModel response,
final List<String> cachedProductIds) = _$CategorySuccessImpl;

GetProductsByCategoryResponseModel get response;
List<String> get cachedProductIds;

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$CategorySuccessImplCopyWith<_$CategorySuccessImpl> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryErrorImplCopyWith<$Res> {
factory _$$CategoryErrorImplCopyWith(
_$CategoryErrorImpl value, $Res Function(_$CategoryErrorImpl) then) =
__$$CategoryErrorImplCopyWithImpl<$Res>;
@useResult
$Res call({ApiErrorModel error});
}

/// @nodoc
class __$$CategoryErrorImplCopyWithImpl<$Res>
extends _$ProductCategoryStateCopyWithImpl<$Res, _$CategoryErrorImpl>
implements _$$CategoryErrorImplCopyWith<$Res> {
__$$CategoryErrorImplCopyWithImpl(
_$CategoryErrorImpl _value, $Res Function(_$CategoryErrorImpl) _then)
    : super(_value, _then);

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? error = null,
}) {
return _then(_$CategoryErrorImpl(
error: null == error
? _value.error
    : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
));
}
}

/// @nodoc

class _$CategoryErrorImpl implements CategoryError {
const _$CategoryErrorImpl({required this.error});

@override
final ApiErrorModel error;

@override
String toString() {
return 'ProductCategoryState.categoryError(error: $error)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$CategoryErrorImpl &&
(identical(other.error, error) || other.error == error));
}

@override
int get hashCode => Object.hash(runtimeType, error);

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$CategoryErrorImplCopyWith<_$CategoryErrorImpl> get copyWith =>
__$$CategoryErrorImplCopyWithImpl<_$CategoryErrorImpl>(this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() categoryLoading,
required TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)
categorySuccess,
required TResult Function(ApiErrorModel error) categoryError,
}) {
return categoryError(error);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? categoryLoading,
TResult? Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult? Function(ApiErrorModel error)? categoryError,
}) {
return categoryError?.call(error);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? categoryLoading,
TResult Function(GetProductsByCategoryResponseModel response,
List<String> cachedProductIds)?
categorySuccess,
TResult Function(ApiErrorModel error)? categoryError,
required TResult orElse(),
}) {
if (categoryError != null) {
return categoryError(error);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial value) initial,
required TResult Function(CategoryLoading value) categoryLoading,
required TResult Function(CategorySuccess value) categorySuccess,
required TResult Function(CategoryError value) categoryError,
}) {
return categoryError(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial value)? initial,
TResult? Function(CategoryLoading value)? categoryLoading,
TResult? Function(CategorySuccess value)? categorySuccess,
TResult? Function(CategoryError value)? categoryError,
}) {
return categoryError?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial value)? initial,
TResult Function(CategoryLoading value)? categoryLoading,
TResult Function(CategorySuccess value)? categorySuccess,
TResult Function(CategoryError value)? categoryError,
required TResult orElse(),
}) {
if (categoryError != null) {
return categoryError(this);
}
return orElse();
}
}

abstract class CategoryError implements ProductCategoryState {
const factory CategoryError({required final ApiErrorModel error}) =
_$CategoryErrorImpl;

ApiErrorModel get error;

/// Create a copy of ProductCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$CategoryErrorImplCopyWith<_$CategoryErrorImpl> get copyWith =>
throw _privateConstructorUsedError;
}