// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int get id => throw _privateConstructorUsedError;
  PostTitle get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call({int id, PostTitle title});

  $PostTitleCopyWith<$Res> get title;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as PostTitle,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostTitleCopyWith<$Res> get title {
    return $PostTitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, PostTitle title});

  @override
  $PostTitleCopyWith<$Res> get title;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_Post(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as PostTitle,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post({required this.id, required this.title});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final int id;
  @override
  final PostTitle title;

  @override
  String toString() {
    return 'Post(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post({required final int id, required final PostTitle title}) =
      _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  int get id;
  @override
  PostTitle get title;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}

PostTitle _$PostTitleFromJson(Map<String, dynamic> json) {
  return _PostTitle.fromJson(json);
}

/// @nodoc
mixin _$PostTitle {
  String get rendered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostTitleCopyWith<PostTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostTitleCopyWith<$Res> {
  factory $PostTitleCopyWith(PostTitle value, $Res Function(PostTitle) then) =
      _$PostTitleCopyWithImpl<$Res, PostTitle>;
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class _$PostTitleCopyWithImpl<$Res, $Val extends PostTitle>
    implements $PostTitleCopyWith<$Res> {
  _$PostTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_value.copyWith(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostTitleCopyWith<$Res> implements $PostTitleCopyWith<$Res> {
  factory _$$_PostTitleCopyWith(
          _$_PostTitle value, $Res Function(_$_PostTitle) then) =
      __$$_PostTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class __$$_PostTitleCopyWithImpl<$Res>
    extends _$PostTitleCopyWithImpl<$Res, _$_PostTitle>
    implements _$$_PostTitleCopyWith<$Res> {
  __$$_PostTitleCopyWithImpl(
      _$_PostTitle _value, $Res Function(_$_PostTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_$_PostTitle(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostTitle implements _PostTitle {
  const _$_PostTitle({required this.rendered});

  factory _$_PostTitle.fromJson(Map<String, dynamic> json) =>
      _$$_PostTitleFromJson(json);

  @override
  final String rendered;

  @override
  String toString() {
    return 'PostTitle(rendered: $rendered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostTitle &&
            (identical(other.rendered, rendered) ||
                other.rendered == rendered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rendered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostTitleCopyWith<_$_PostTitle> get copyWith =>
      __$$_PostTitleCopyWithImpl<_$_PostTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostTitleToJson(
      this,
    );
  }
}

abstract class _PostTitle implements PostTitle {
  const factory _PostTitle({required final String rendered}) = _$_PostTitle;

  factory _PostTitle.fromJson(Map<String, dynamic> json) =
      _$_PostTitle.fromJson;

  @override
  String get rendered;
  @override
  @JsonKey(ignore: true)
  _$$_PostTitleCopyWith<_$_PostTitle> get copyWith =>
      throw _privateConstructorUsedError;
}
