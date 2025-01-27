// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      json['photoUrl'] as String?,
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      comment: json['comment'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'comment': instance.comment,
      'timestamp': instance.timestamp,
      'photoUrl': instance.photoUrl,
    };
