import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/utility/theme/firebase/base_firebase_model.dart';
part 'weeklypicks_model.g.dart';


@JsonSerializable()
@immutable
class WeeklyPicks extends Equatable with BaseFirebaseModel<WeeklyPicks> {
  final String? image;
  final String? subtitle;
  final String? userId;
  @override
  final String? id;
  const WeeklyPicks({this.image, this.subtitle, this.userId, this.id});

  @override
  List<Object?> get props => [image, subtitle, userId, id];

  WeeklyPicks copyWith({
    String? image,
    String? subtitle,
    String? userId,
  }) {
    return WeeklyPicks(
      image: image ?? this.image,
      subtitle: subtitle ?? this.subtitle,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$WeeklyPicksToJson(this);
  }

  factory WeeklyPicks.fromJson(Map<String, dynamic> json) {
    return _$WeeklyPicksFromJson(json);
  }

  @override
  WeeklyPicks fromJson(Map<String, dynamic> json) => WeeklyPicks.fromJson(json);
}
