import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_post.freezed.dart';
part 'm_post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required PostTitle title,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class PostTitle with _$PostTitle {
  const factory PostTitle({
    required String rendered,
  }) = _PostTitle;
  factory PostTitle.fromJson(Map<String, dynamic> json) =>
      _$PostTitleFromJson(json);
}
