import 'package:loomi_player/domain/entities/video_entity.dart';

abstract class VideoRepository {
  Future<List<VideoEntity>> getVideos();
  Future<void> likeVideo(String videoId);
  Future<void> commentOnVideo(String videoId, Map<String, dynamic> comment);
}
