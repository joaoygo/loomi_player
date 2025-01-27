import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel {
  final String? id;
  final String? userName;
  final String? comment;
  final String? timestamp;
  final String? photoUrl;

  CommentsModel(
    this.photoUrl, {
    this.id,
    this.userName,
    this.comment,
    this.timestamp,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}
