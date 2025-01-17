// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      id: (json['id'] as num).toInt(),
      attributes:
          VideoAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

VideoAttributes _$VideoAttributesFromJson(Map<String, dynamic> json) =>
    VideoAttributes(
      name: json['name'] as String,
      synopsis: json['synopsis'] as String,
      currentlyPlaying: json['currently_playing'] as bool,
      streamLink: json['stream_link'] as String,
      genre: json['genre'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      publishedAt: json['publishedAt'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$VideoAttributesToJson(VideoAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'synopsis': instance.synopsis,
      'currently_playing': instance.currentlyPlaying,
      'stream_link': instance.streamLink,
      'genre': instance.genre,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'end_date': instance.endDate,
    };
