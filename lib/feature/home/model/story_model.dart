// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/core/utility/theme/firebase/base_firebase_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
@immutable
class StoryModel extends Equatable with BaseFirebaseModel<StoryModel> {
  final String? image;
  final String? userId;
  @override
  final String? id;
  @override
  const StoryModel({this.image, this.userId, this.id});

  StoryModel copyWith({
    String? image,
    String? userId,
  }) {
    return StoryModel(
      image: image ?? this.image,
      userId: userId ?? this.userId,
    );
  }

  @override
  fromJson(Map<String, dynamic> json) => StoryModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$StoryModelToJson(this);
  }

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return _$StoryModelFromJson(json);
  }

  @override
  List<Object?> get props => [image, userId, id];
}
