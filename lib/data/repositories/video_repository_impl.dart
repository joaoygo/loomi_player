import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/domain/repositories/video_repository.dart';

import '../sources/video_api.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoApi api;

  VideoRepositoryImpl({required this.api});

  @override
  Future<List<VideoEntity>> getVideos() async {
    final response = await api.getVideos();

    if (response.data.isNotEmpty) {
      final videos = response.data
          .map((videoModel) => VideoEntity(
                id: videoModel.id,
                name: videoModel.attributes.name,
                synopsis: videoModel.attributes.synopsis,
                currentlyPlaying: videoModel.attributes.currentlyPlaying,
                streamLink: videoModel.attributes.streamLink,
                genre: videoModel.attributes.genre,
                createdAt: DateTime.parse(videoModel.attributes.createdAt),
                updatedAt: DateTime.parse(videoModel.attributes.updatedAt),
                publishedAt: DateTime.parse(videoModel.attributes.publishedAt),
                endDate: DateTime.parse(videoModel.attributes.endDate),
              ))
          .toList();

      return videos;
    } else {
      throw Exception('A resposta da API não contém dados.');
    }
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
