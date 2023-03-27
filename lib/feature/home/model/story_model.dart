// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel extends Equatable {
  final String? image;
  final String? userId;

  const StoryModel({
    this.image,
    this.userId,
  });

  StoryModel copyWith({
    String? image,
    String? userId,
  }) {
    return StoryModel(
      image: image ?? this.image,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'userId': userId,
    };
  }

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      image: json['image'] as String?,
      userId: json['userId'] as String?,
    );
  }

  @override
  List<Object?> get props => [image, userId];
}
