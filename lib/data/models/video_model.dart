import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  final int id;
  final VideoAttributes attributes;

  VideoModel({required this.id, required this.attributes});

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

@JsonSerializable()
class VideoAttributes {
  final String name;
  final String synopsis;
  @JsonKey(name: 'currently_playing')
  final bool currentlyPlaying;
  @JsonKey(name: 'stream_link')
  final String streamLink;
  final String genre;
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @JsonKey(name: 'publishedAt')
  final String publishedAt;
  @JsonKey(name: 'end_date')
  final String endDate;

  VideoAttributes({
    required this.name,
    required this.synopsis,
    required this.currentlyPlaying,
    required this.streamLink,
    required this.genre,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.endDate,
  });

  factory VideoAttributes.fromJson(Map<String, dynamic> json) =>
      _$VideoAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$VideoAttributesToJson(this);
}
