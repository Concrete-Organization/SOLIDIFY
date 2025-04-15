// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostsState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postsLoading,
    required TResult Function(List<PostModel> posts, bool hasMorePosts,
        int currentPage, int totalPages)
    postsSuccess,
    required TResult Function(List<PostModel> currentPosts, int currentPage)
    loadingMorePosts,
    required TResult Function(ApiErrorModel error) postsError,
    required TResult Function() createPostLoading,
    required TResult Function(CreatePostResponse response) createPostSuccess,
    required TResult Function(ApiErrorModel error) createPostError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postsLoading,
    TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
        int totalPages)?
    postsSuccess,
    TResult? Function(List<PostModel> currentPosts, int currentPage)?
    loadingMorePosts,
    TResult? Function(ApiErrorModel error)? postsError,
    TResult? Function()? createPostLoading,
    TResult? Function(CreatePostResponse response)? createPostSuccess,
    TResult? Function(ApiErrorModel error)? createPostError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
  TResult Function()? initial,
  TResult Function()? postsLoading,
  TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
  int totalPages)?
  postsSuccess,
  TResult Function(List<PostModel> currentPosts, int currentPage)?
  loadingMorePosts,
  TResult Function(ApiErrorModel error)? postsError,
  TResult Function()? createPostLoading,
  TResult Function(CreatePostResponse response)? createPostSuccess,
  TResult Function(ApiErrorModel error)? createPostError,
  required TResult orElse(),
}) =>
throw _privateConstructorUsedError;
@optionalTypeArgs
TResult map<TResult extends Object?>({
  required TResult Function(_Initial<T> value) initial,
  required TResult Function(PostsLoading<T> value) postsLoading,
  required TResult Function(PostsSuccess<T> value) postsSuccess,
  required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
  required TResult Function(PostsError<T> value) postsError,
  required TResult Function(CreatePostLoading<T> value) createPostLoading,
  required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
  required TResult Function(CreatePostError<T> value) createPostError,
}) =>
    throw _privateConstructorUsedError;
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
  TResult? Function(_Initial<T> value)? initial,
  TResult? Function(PostsLoading<T> value)? postsLoading,
  TResult? Function(PostsSuccess<T> value)? postsSuccess,
  TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
  TResult? Function(PostsError<T> value)? postsError,
  TResult? Function(CreatePostLoading<T> value)? createPostLoading,
  TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
  TResult? Function(CreatePostError<T> value)? createPostError,
}) =>
    throw _privateConstructorUsedError;
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<T, $Res> {
factory $PostsStateCopyWith(
PostsState<T> value, $Res Function(PostsState<T>) then) =
_$PostsStateCopyWithImpl<T, $Res, PostsState<T>>;
}

/// @nodoc
class _$PostsStateCopyWithImpl<T, $Res, $Val extends PostsState<T>>
implements $PostsStateCopyWith<T, $Res> {
_$PostsStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
final $Val _value;
// ignore: unused_field
final $Res Function($Val) _then;

/// Create a copy of PostsState
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
extends _$PostsStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
implements _$$InitialImplCopyWith<T, $Res> {
__$$InitialImplCopyWithImpl(
_$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
const _$InitialImpl();

@override
String toString() {
return 'PostsState<$T>.initial()';
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
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return initial();
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return initial?.call();
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
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
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return initial(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return initial?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (initial != null) {
return initial(this);
}
return orElse();
}
}

abstract class _Initial<T> implements PostsState<T> {
const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$PostsLoadingImplCopyWith<T, $Res> {
factory _$$PostsLoadingImplCopyWith(_$PostsLoadingImpl<T> value,
$Res Function(_$PostsLoadingImpl<T>) then) =
__$$PostsLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$PostsLoadingImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$PostsLoadingImpl<T>>
implements _$$PostsLoadingImplCopyWith<T, $Res> {
__$$PostsLoadingImplCopyWithImpl(
_$PostsLoadingImpl<T> _value, $Res Function(_$PostsLoadingImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostsLoadingImpl<T> implements PostsLoading<T> {
const _$PostsLoadingImpl();

@override
String toString() {
return 'PostsState<$T>.postsLoading()';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType && other is _$PostsLoadingImpl<T>);
}

@override
int get hashCode => runtimeType.hashCode;

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return postsLoading();
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return postsLoading?.call();
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (postsLoading != null) {
return postsLoading();
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return postsLoading(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return postsLoading?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (postsLoading != null) {
return postsLoading(this);
}
return orElse();
}
}

abstract class PostsLoading<T> implements PostsState<T> {
const factory PostsLoading() = _$PostsLoadingImpl<T>;
}

/// @nodoc
abstract class _$$PostsSuccessImplCopyWith<T, $Res> {
factory _$$PostsSuccessImplCopyWith(_$PostsSuccessImpl<T> value,
$Res Function(_$PostsSuccessImpl<T>) then) =
__$$PostsSuccessImplCopyWithImpl<T, $Res>;
@useResult
$Res call(
{List<PostModel> posts,
bool hasMorePosts,
int currentPage,
int totalPages});
}

/// @nodoc
class __$$PostsSuccessImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$PostsSuccessImpl<T>>
implements _$$PostsSuccessImplCopyWith<T, $Res> {
__$$PostsSuccessImplCopyWithImpl(
_$PostsSuccessImpl<T> _value, $Res Function(_$PostsSuccessImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? posts = null,
Object? hasMorePosts = null,
Object? currentPage = null,
Object? totalPages = null,
}) {
return _then(_$PostsSuccessImpl<T>(
posts: null == posts
? _value._posts
    : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,
hasMorePosts: null == hasMorePosts
? _value.hasMorePosts
    : hasMorePosts // ignore: cast_nullable_to_non_nullable
as bool,
currentPage: null == currentPage
? _value.currentPage
    : currentPage // ignore: cast_nullable_to_non_nullable
as int,
totalPages: null == totalPages
? _value.totalPages
    : totalPages // ignore: cast_nullable_to_non_nullable
as int,
));
}
}

/// @nodoc

class _$PostsSuccessImpl<T> implements PostsSuccess<T> {
const _$PostsSuccessImpl(
{required final List<PostModel> posts,
required this.hasMorePosts,
required this.currentPage,
required this.totalPages})
    : _posts = posts;

final List<PostModel> _posts;
@override
List<PostModel> get posts {
if (_posts is EqualUnmodifiableListView) return _posts;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_posts);
}

@override
final bool hasMorePosts;
@override
final int currentPage;
@override
final int totalPages;

@override
String toString() {
return 'PostsState<$T>.postsSuccess(posts: $posts, hasMorePosts: $hasMorePosts, currentPage: $currentPage, totalPages: $totalPages)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$PostsSuccessImpl<T> &&
const DeepCollectionEquality().equals(other._posts, _posts) &&
(identical(other.hasMorePosts, hasMorePosts) ||
other.hasMorePosts == hasMorePosts) &&
(identical(other.currentPage, currentPage) ||
other.currentPage == currentPage) &&
(identical(other.totalPages, totalPages) ||
other.totalPages == totalPages));
}

@override
int get hashCode => Object.hash(
runtimeType,
const DeepCollectionEquality().hash(_posts),
hasMorePosts,
currentPage,
totalPages);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$PostsSuccessImplCopyWith<T, _$PostsSuccessImpl<T>> get copyWith =>
__$$PostsSuccessImplCopyWithImpl<T, _$PostsSuccessImpl<T>>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return postsSuccess(posts, hasMorePosts, currentPage, totalPages);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return postsSuccess?.call(posts, hasMorePosts, currentPage, totalPages);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (postsSuccess != null) {
return postsSuccess(posts, hasMorePosts, currentPage, totalPages);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return postsSuccess(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return postsSuccess?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (postsSuccess != null) {
return postsSuccess(this);
}
return orElse();
}
}

abstract class PostsSuccess<T> implements PostsState<T> {
const factory PostsSuccess(
{required final List<PostModel> posts,
required final bool hasMorePosts,
required final int currentPage,
required final int totalPages}) = _$PostsSuccessImpl<T>;

List<PostModel> get posts;
bool get hasMorePosts;
int get currentPage;
int get totalPages;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$PostsSuccessImplCopyWith<T, _$PostsSuccessImpl<T>> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingMorePostsImplCopyWith<T, $Res> {
factory _$$LoadingMorePostsImplCopyWith(_$LoadingMorePostsImpl<T> value,
$Res Function(_$LoadingMorePostsImpl<T>) then) =
__$$LoadingMorePostsImplCopyWithImpl<T, $Res>;
@useResult
$Res call({List<PostModel> currentPosts, int currentPage});
}

/// @nodoc
class __$$LoadingMorePostsImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$LoadingMorePostsImpl<T>>
implements _$$LoadingMorePostsImplCopyWith<T, $Res> {
__$$LoadingMorePostsImplCopyWithImpl(_$LoadingMorePostsImpl<T> _value,
$Res Function(_$LoadingMorePostsImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? currentPosts = null,
Object? currentPage = null,
}) {
return _then(_$LoadingMorePostsImpl<T>(
currentPosts: null == currentPosts
? _value._currentPosts
    : currentPosts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,
currentPage: null == currentPage
? _value.currentPage
    : currentPage // ignore: cast_nullable_to_non_nullable
as int,
));
}
}

/// @nodoc

class _$LoadingMorePostsImpl<T> implements LoadingMorePosts<T> {
const _$LoadingMorePostsImpl(
{required final List<PostModel> currentPosts, required this.currentPage})
    : _currentPosts = currentPosts;

final List<PostModel> _currentPosts;
@override
List<PostModel> get currentPosts {
if (_currentPosts is EqualUnmodifiableListView) return _currentPosts;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_currentPosts);
}

@override
final int currentPage;

@override
String toString() {
return 'PostsState<$T>.loadingMorePosts(currentPosts: $currentPosts, currentPage: $currentPage)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$LoadingMorePostsImpl<T> &&
const DeepCollectionEquality()
    .equals(other._currentPosts, _currentPosts) &&
(identical(other.currentPage, currentPage) ||
other.currentPage == currentPage));
}

@override
int get hashCode => Object.hash(runtimeType,
const DeepCollectionEquality().hash(_currentPosts), currentPage);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$LoadingMorePostsImplCopyWith<T, _$LoadingMorePostsImpl<T>> get copyWith =>
__$$LoadingMorePostsImplCopyWithImpl<T, _$LoadingMorePostsImpl<T>>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return loadingMorePosts(currentPosts, currentPage);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return loadingMorePosts?.call(currentPosts, currentPage);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (loadingMorePosts != null) {
return loadingMorePosts(currentPosts, currentPage);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return loadingMorePosts(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return loadingMorePosts?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (loadingMorePosts != null) {
return loadingMorePosts(this);
}
return orElse();
}
}

abstract class LoadingMorePosts<T> implements PostsState<T> {
const factory LoadingMorePosts(
{required final List<PostModel> currentPosts,
required final int currentPage}) = _$LoadingMorePostsImpl<T>;

List<PostModel> get currentPosts;
int get currentPage;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$LoadingMorePostsImplCopyWith<T, _$LoadingMorePostsImpl<T>> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostsErrorImplCopyWith<T, $Res> {
factory _$$PostsErrorImplCopyWith(
_$PostsErrorImpl<T> value, $Res Function(_$PostsErrorImpl<T>) then) =
__$$PostsErrorImplCopyWithImpl<T, $Res>;
@useResult
$Res call({ApiErrorModel error});
}

/// @nodoc
class __$$PostsErrorImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$PostsErrorImpl<T>>
implements _$$PostsErrorImplCopyWith<T, $Res> {
__$$PostsErrorImplCopyWithImpl(
_$PostsErrorImpl<T> _value, $Res Function(_$PostsErrorImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? error = null,
}) {
return _then(_$PostsErrorImpl<T>(
error: null == error
? _value.error
    : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
));
}
}

/// @nodoc

class _$PostsErrorImpl<T> implements PostsError<T> {
const _$PostsErrorImpl({required this.error});

@override
final ApiErrorModel error;

@override
String toString() {
return 'PostsState<$T>.postsError(error: $error)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$PostsErrorImpl<T> &&
(identical(other.error, error) || other.error == error));
}

@override
int get hashCode => Object.hash(runtimeType, error);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$PostsErrorImplCopyWith<T, _$PostsErrorImpl<T>> get copyWith =>
__$$PostsErrorImplCopyWithImpl<T, _$PostsErrorImpl<T>>(this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return postsError(error);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return postsError?.call(error);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (postsError != null) {
return postsError(error);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return postsError(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return postsError?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (postsError != null) {
return postsError(this);
}
return orElse();
}
}

abstract class PostsError<T> implements PostsState<T> {
const factory PostsError({required final ApiErrorModel error}) =
_$PostsErrorImpl<T>;

ApiErrorModel get error;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$PostsErrorImplCopyWith<T, _$PostsErrorImpl<T>> get copyWith =>
throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatePostLoadingImplCopyWith<T, $Res> {
factory _$$CreatePostLoadingImplCopyWith(_$CreatePostLoadingImpl<T> value,
$Res Function(_$CreatePostLoadingImpl<T>) then) =
__$$CreatePostLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CreatePostLoadingImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$CreatePostLoadingImpl<T>>
implements _$$CreatePostLoadingImplCopyWith<T, $Res> {
__$$CreatePostLoadingImplCopyWithImpl(_$CreatePostLoadingImpl<T> _value,
$Res Function(_$CreatePostLoadingImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatePostLoadingImpl<T> implements CreatePostLoading<T> {
const _$CreatePostLoadingImpl();

@override
String toString() {
return 'PostsState<$T>.createPostLoading()';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$CreatePostLoadingImpl<T>);
}

@override
int get hashCode => runtimeType.hashCode;

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return createPostLoading();
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return createPostLoading?.call();
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (createPostLoading != null) {
return createPostLoading();
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return createPostLoading(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return createPostLoading?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (createPostLoading != null) {
return createPostLoading(this);
}
return orElse();
}
}

abstract class CreatePostLoading<T> implements PostsState<T> {
const factory CreatePostLoading() = _$CreatePostLoadingImpl<T>;
}

/// @nodoc
abstract class _$$CreatePostSuccessImplCopyWith<T, $Res> {
factory _$$CreatePostSuccessImplCopyWith(_$CreatePostSuccessImpl<T> value,
$Res Function(_$CreatePostSuccessImpl<T>) then) =
__$$CreatePostSuccessImplCopyWithImpl<T, $Res>;
@useResult
$Res call({CreatePostResponse response});
}

/// @nodoc
class __$$CreatePostSuccessImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$CreatePostSuccessImpl<T>>
implements _$$CreatePostSuccessImplCopyWith<T, $Res> {
__$$CreatePostSuccessImplCopyWithImpl(_$CreatePostSuccessImpl<T> _value,
$Res Function(_$CreatePostSuccessImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? response = null,
}) {
return _then(_$CreatePostSuccessImpl<T>(
null == response
? _value.response
    : response // ignore: cast_nullable_to_non_nullable
as CreatePostResponse,
));
}
}

/// @nodoc

class _$CreatePostSuccessImpl<T> implements CreatePostSuccess<T> {
const _$CreatePostSuccessImpl(this.response);

@override
final CreatePostResponse response;

@override
String toString() {
return 'PostsState<$T>.createPostSuccess(response: $response)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$CreatePostSuccessImpl<T> &&
(identical(other.response, response) ||
other.response == response));
}

@override
int get hashCode => Object.hash(runtimeType, response);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$CreatePostSuccessImplCopyWith<T, _$CreatePostSuccessImpl<T>>
get copyWith =>
__$$CreatePostSuccessImplCopyWithImpl<T, _$CreatePostSuccessImpl<T>>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return createPostSuccess(response);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return createPostSuccess?.call(response);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (createPostSuccess != null) {
return createPostSuccess(response);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return createPostSuccess(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return createPostSuccess?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (createPostSuccess != null) {
return createPostSuccess(this);
}
return orElse();
}
}

abstract class CreatePostSuccess<T> implements PostsState<T> {
const factory CreatePostSuccess(final CreatePostResponse response) =
_$CreatePostSuccessImpl<T>;

CreatePostResponse get response;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$CreatePostSuccessImplCopyWith<T, _$CreatePostSuccessImpl<T>>
get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatePostErrorImplCopyWith<T, $Res> {
factory _$$CreatePostErrorImplCopyWith(_$CreatePostErrorImpl<T> value,
$Res Function(_$CreatePostErrorImpl<T>) then) =
__$$CreatePostErrorImplCopyWithImpl<T, $Res>;
@useResult
$Res call({ApiErrorModel error});
}

/// @nodoc
class __$$CreatePostErrorImplCopyWithImpl<T, $Res>
extends _$PostsStateCopyWithImpl<T, $Res, _$CreatePostErrorImpl<T>>
implements _$$CreatePostErrorImplCopyWith<T, $Res> {
__$$CreatePostErrorImplCopyWithImpl(_$CreatePostErrorImpl<T> _value,
$Res Function(_$CreatePostErrorImpl<T>) _then)
    : super(_value, _then);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline')
@override
$Res call({
Object? error = null,
}) {
return _then(_$CreatePostErrorImpl<T>(
error: null == error
? _value.error
    : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
));
}
}

/// @nodoc

class _$CreatePostErrorImpl<T> implements CreatePostError<T> {
const _$CreatePostErrorImpl({required this.error});

@override
final ApiErrorModel error;

@override
String toString() {
return 'PostsState<$T>.createPostError(error: $error)';
}

@override
bool operator ==(Object other) {
return identical(this, other) ||
(other.runtimeType == runtimeType &&
other is _$CreatePostErrorImpl<T> &&
(identical(other.error, error) || other.error == error));
}

@override
int get hashCode => Object.hash(runtimeType, error);

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$CreatePostErrorImplCopyWith<T, _$CreatePostErrorImpl<T>> get copyWith =>
__$$CreatePostErrorImplCopyWithImpl<T, _$CreatePostErrorImpl<T>>(
this, _$identity);

@override
@optionalTypeArgs
TResult when<TResult extends Object?>({
required TResult Function() initial,
required TResult Function() postsLoading,
required TResult Function(List<PostModel> posts, bool hasMorePosts,
int currentPage, int totalPages)
postsSuccess,
required TResult Function(List<PostModel> currentPosts, int currentPage)
loadingMorePosts,
required TResult Function(ApiErrorModel error) postsError,
required TResult Function() createPostLoading,
required TResult Function(CreatePostResponse response) createPostSuccess,
required TResult Function(ApiErrorModel error) createPostError,
}) {
return createPostError(error);
}

@override
@optionalTypeArgs
TResult? whenOrNull<TResult extends Object?>({
TResult? Function()? initial,
TResult? Function()? postsLoading,
TResult? Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult? Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult? Function(ApiErrorModel error)? postsError,
TResult? Function()? createPostLoading,
TResult? Function(CreatePostResponse response)? createPostSuccess,
TResult? Function(ApiErrorModel error)? createPostError,
}) {
return createPostError?.call(error);
}

@override
@optionalTypeArgs
TResult maybeWhen<TResult extends Object?>({
TResult Function()? initial,
TResult Function()? postsLoading,
TResult Function(List<PostModel> posts, bool hasMorePosts, int currentPage,
int totalPages)?
postsSuccess,
TResult Function(List<PostModel> currentPosts, int currentPage)?
loadingMorePosts,
TResult Function(ApiErrorModel error)? postsError,
TResult Function()? createPostLoading,
TResult Function(CreatePostResponse response)? createPostSuccess,
TResult Function(ApiErrorModel error)? createPostError,
required TResult orElse(),
}) {
if (createPostError != null) {
return createPostError(error);
}
return orElse();
}

@override
@optionalTypeArgs
TResult map<TResult extends Object?>({
required TResult Function(_Initial<T> value) initial,
required TResult Function(PostsLoading<T> value) postsLoading,
required TResult Function(PostsSuccess<T> value) postsSuccess,
required TResult Function(LoadingMorePosts<T> value) loadingMorePosts,
required TResult Function(PostsError<T> value) postsError,
required TResult Function(CreatePostLoading<T> value) createPostLoading,
required TResult Function(CreatePostSuccess<T> value) createPostSuccess,
required TResult Function(CreatePostError<T> value) createPostError,
}) {
return createPostError(this);
}

@override
@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>({
TResult? Function(_Initial<T> value)? initial,
TResult? Function(PostsLoading<T> value)? postsLoading,
TResult? Function(PostsSuccess<T> value)? postsSuccess,
TResult? Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult? Function(PostsError<T> value)? postsError,
TResult? Function(CreatePostLoading<T> value)? createPostLoading,
TResult? Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult? Function(CreatePostError<T> value)? createPostError,
}) {
return createPostError?.call(this);
}

@override
@optionalTypeArgs
TResult maybeMap<TResult extends Object?>({
TResult Function(_Initial<T> value)? initial,
TResult Function(PostsLoading<T> value)? postsLoading,
TResult Function(PostsSuccess<T> value)? postsSuccess,
TResult Function(LoadingMorePosts<T> value)? loadingMorePosts,
TResult Function(PostsError<T> value)? postsError,
TResult Function(CreatePostLoading<T> value)? createPostLoading,
TResult Function(CreatePostSuccess<T> value)? createPostSuccess,
TResult Function(CreatePostError<T> value)? createPostError,
required TResult orElse(),
}) {
if (createPostError != null) {
return createPostError(this);
}
return orElse();
}
}

abstract class CreatePostError<T> implements PostsState<T> {
const factory CreatePostError({required final ApiErrorModel error}) =
_$CreatePostErrorImpl<T>;

ApiErrorModel get error;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$CreatePostErrorImplCopyWith<T, _$CreatePostErrorImpl<T>> get copyWith =>
throw _privateConstructorUsedError;
}