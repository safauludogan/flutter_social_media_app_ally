// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
      comments: json['comments'] as String?,
      image: json['image'] as String?,
      likeCount: json['likeCount'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'comments': instance.comments,
      'image': instance.image,
      'likeCount': instance.likeCount,
      'id': instance.id,
    };
