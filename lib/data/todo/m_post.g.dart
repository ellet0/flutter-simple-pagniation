// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as int,
      title: PostTitle.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$_PostTitle _$$_PostTitleFromJson(Map<String, dynamic> json) => _$_PostTitle(
      rendered: json['rendered'] as String,
    );

Map<String, dynamic> _$$_PostTitleToJson(_$_PostTitle instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };
