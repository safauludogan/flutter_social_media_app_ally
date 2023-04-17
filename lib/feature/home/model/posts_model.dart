import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utility/theme/firebase/base_firebase_model.dart';
part 'posts_model.g.dart';

@JsonSerializable()
@immutable
class Posts extends Equatable with BaseFirebaseModel<Posts> {
  final String? comments;
  final String? image;
  final int? likeCount;
  @override
  final String? id;

  const Posts({
    this.comments,
    this.image,
    this.likeCount,
    this.id,
  });

  @override
  List<Object?> get props => [comments, image, likeCount];

  Posts copyWith({
    String? comments,
    String? image,
    int? likeCount,
  }) {
    return Posts(
      comments: comments ?? this.comments,
      image: image ?? this.image,
      likeCount: likeCount ?? this.likeCount,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PostsToJson(this);
  }

  factory Posts.fromJson(Map<String, dynamic> json) {
    return _$PostsFromJson(json);
  }

  @override
  Posts fromJson(Map<String, dynamic> json) => Posts.fromJson(json);
}
