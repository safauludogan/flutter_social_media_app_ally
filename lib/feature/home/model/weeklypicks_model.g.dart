// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weeklypicks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyPicks _$WeeklyPicksFromJson(Map<String, dynamic> json) => WeeklyPicks(
      image: json['image'] as String?,
      subtitle: json['subtitle'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WeeklyPicksToJson(WeeklyPicks instance) =>
    <String, dynamic>{
      'image': instance.image,
      'subtitle': instance.subtitle,
      'userId': instance.userId,
      'id': instance.id,
    };
