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
mixin _$ProductCategoryState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(GetProductsByCategoryResponseModel category)
        categorySuccess,
    required TResult Function(ApiErrorModel error) categoryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(GetProductsByCategoryResponseModel category)?
        categorySuccess,
    TResult? Function(ApiErrorModel error)? categoryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(GetProductsByCategoryResponseModel category)?
        categorySuccess,
    TResult Function(ApiErrorModel error)? categoryError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryError<T> value) categoryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryError<T> value)? categoryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryError<T> value)? categoryError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryStateCopyWith<T, $Res> {
  factory $ProductCategoryStateCopyWith(ProductCategoryState<T> value,
          $Res Function(ProductCategoryState<T>) then) =
      _$ProductCategoryStateCopyWithImpl<T, $Res, ProductCategoryState<T>>;
}

/// @nodoc
class _$ProductCategoryStateCopyWithImpl<T, $Res,
        $Val extends ProductCategoryState<T>>
    implements $ProductCategoryStateCopyWith<T, $Res> {
  _$ProductCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCategoryState
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
    extends _$ProductCategoryStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductCategoryState<$T>.initial()';
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
    required TResult Function() categoryLoading,
    required TResult Function(GetProductsByCategoryResponseModel category)
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
    TResult? Function(GetProductsByCategoryResponseModel category)?
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
    TResult Function(GetProductsByCategoryResponseModel category)?
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryError<T> value) categoryError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryError<T> value)? categoryError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryError<T> value)? categoryError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProductCategoryState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$CategoryLoadingImplCopyWith<T, $Res> {
  factory _$$CategoryLoadingImplCopyWith(_$CategoryLoadingImpl<T> value,
          $Res Function(_$CategoryLoadingImpl<T>) then) =
      __$$CategoryLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CategoryLoadingImplCopyWithImpl<T, $Res>
    extends _$ProductCategoryStateCopyWithImpl<T, $Res,
        _$CategoryLoadingImpl<T>>
    implements _$$CategoryLoadingImplCopyWith<T, $Res> {
  __$$CategoryLoadingImplCopyWithImpl(_$CategoryLoadingImpl<T> _value,
      $Res Function(_$CategoryLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoryLoadingImpl<T> implements CategoryLoading<T> {
  const _$CategoryLoadingImpl();

  @override
  String toString() {
    return 'ProductCategoryState<$T>.categoryLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(GetProductsByCategoryResponseModel category)
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
    TResult? Function(GetProductsByCategoryResponseModel category)?
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
    TResult Function(GetProductsByCategoryResponseModel category)?
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryError<T> value) categoryError,
  }) {
    return categoryLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryError<T> value)? categoryError,
  }) {
    return categoryLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryError<T> value)? categoryError,
    required TResult orElse(),
  }) {
    if (categoryLoading != null) {
      return categoryLoading(this);
    }
    return orElse();
  }
}

abstract class CategoryLoading<T> implements ProductCategoryState<T> {
  const factory CategoryLoading() = _$CategoryLoadingImpl<T>;
}

/// @nodoc
abstract class _$$CategorySuccessImplCopyWith<T, $Res> {
  factory _$$CategorySuccessImplCopyWith(_$CategorySuccessImpl<T> value,
          $Res Function(_$CategorySuccessImpl<T>) then) =
      __$$CategorySuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({GetProductsByCategoryResponseModel category});
}

/// @nodoc
class __$$CategorySuccessImplCopyWithImpl<T, $Res>
    extends _$ProductCategoryStateCopyWithImpl<T, $Res,
        _$CategorySuccessImpl<T>>
    implements _$$CategorySuccessImplCopyWith<T, $Res> {
  __$$CategorySuccessImplCopyWithImpl(_$CategorySuccessImpl<T> _value,
      $Res Function(_$CategorySuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategorySuccessImpl<T>(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GetProductsByCategoryResponseModel,
    ));
  }
}

/// @nodoc

class _$CategorySuccessImpl<T> implements CategorySuccess<T> {
  const _$CategorySuccessImpl(this.category);

  @override
  final GetProductsByCategoryResponseModel category;

  @override
  String toString() {
    return 'ProductCategoryState<$T>.categorySuccess(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySuccessImpl<T> &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySuccessImplCopyWith<T, _$CategorySuccessImpl<T>> get copyWith =>
      __$$CategorySuccessImplCopyWithImpl<T, _$CategorySuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(GetProductsByCategoryResponseModel category)
        categorySuccess,
    required TResult Function(ApiErrorModel error) categoryError,
  }) {
    return categorySuccess(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(GetProductsByCategoryResponseModel category)?
        categorySuccess,
    TResult? Function(ApiErrorModel error)? categoryError,
  }) {
    return categorySuccess?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(GetProductsByCategoryResponseModel category)?
        categorySuccess,
    TResult Function(ApiErrorModel error)? categoryError,
    required TResult orElse(),
  }) {
    if (categorySuccess != null) {
      return categorySuccess(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryError<T> value) categoryError,
  }) {
    return categorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryError<T> value)? categoryError,
  }) {
    return categorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryError<T> value)? categoryError,
    required TResult orElse(),
  }) {
    if (categorySuccess != null) {
      return categorySuccess(this);
    }
    return orElse();
  }
}

abstract class CategorySuccess<T> implements ProductCategoryState<T> {
  const factory CategorySuccess(
          final GetProductsByCategoryResponseModel category) =
      _$CategorySuccessImpl<T>;

  GetProductsByCategoryResponseModel get category;

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySuccessImplCopyWith<T, _$CategorySuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryErrorImplCopyWith<T, $Res> {
  factory _$$CategoryErrorImplCopyWith(_$CategoryErrorImpl<T> value,
          $Res Function(_$CategoryErrorImpl<T>) then) =
      __$$CategoryErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$CategoryErrorImplCopyWithImpl<T, $Res>
    extends _$ProductCategoryStateCopyWithImpl<T, $Res, _$CategoryErrorImpl<T>>
    implements _$$CategoryErrorImplCopyWith<T, $Res> {
  __$$CategoryErrorImplCopyWithImpl(_$CategoryErrorImpl<T> _value,
      $Res Function(_$CategoryErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CategoryErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$CategoryErrorImpl<T> implements CategoryError<T> {
  const _$CategoryErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'ProductCategoryState<$T>.categoryError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryErrorImplCopyWith<T, _$CategoryErrorImpl<T>> get copyWith =>
      __$$CategoryErrorImplCopyWithImpl<T, _$CategoryErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(GetProductsByCategoryResponseModel category)
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
    TResult? Function(GetProductsByCategoryResponseModel category)?
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
    TResult Function(GetProductsByCategoryResponseModel category)?
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryError<T> value) categoryError,
  }) {
    return categoryError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryError<T> value)? categoryError,
  }) {
    return categoryError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryError<T> value)? categoryError,
    required TResult orElse(),
  }) {
    if (categoryError != null) {
      return categoryError(this);
    }
    return orElse();
  }
}

abstract class CategoryError<T> implements ProductCategoryState<T> {
  const factory CategoryError({required final ApiErrorModel error}) =
      _$CategoryErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of ProductCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryErrorImplCopyWith<T, _$CategoryErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
