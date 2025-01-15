import 'package:loomi_player/data/models/video_model.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/domain/repositories/video_repository.dart';

import '../sources/video_api.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoApi api;

  VideoRepositoryImpl({required this.api});

  @override
  Future<List<VideoEntity>> getVideos() async {
    final response = await api.getVideos();

    final List<VideoModel> videoList = (response.data as List)
        .map((json) => VideoModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return videoList.map((VideoModel model) {
      final attributes = model.attributes;

      return VideoEntity(
        id: model.id,
        name: attributes.name,
        synopsis: attributes.synopsis,
        currentlyPlaying: attributes.currentlyPlaying,
        streamLink: attributes.streamLink,
        genre: attributes.genre,
        createdAt: DateTime.parse(attributes.createdAt),
        updatedAt: DateTime.parse(attributes.updatedAt),
        publishedAt: DateTime.parse(attributes.publishedAt),
        endDate: DateTime.parse(attributes.endDate),
      );
    }).toList();
  }

  @override
  Future<void> commentOnVideo(String videoId, Map<String, dynamic> comment) {
    throw UnimplementedError();
  }

  @override
  Future<void> likeVideo(String videoId) {
    throw UnimplementedError();
  }
}
