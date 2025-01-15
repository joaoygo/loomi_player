import 'package:dartz/dartz.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/domain/repositories/video_repository.dart';

class GetVideosUseCase {
  final VideoRepository repository;

  GetVideosUseCase(this.repository);

  Future<Either<Exception, List<VideoEntity>>> call() async {
    try {
      final videos = await repository.getVideos();
      return Right(videos);
    } catch (e) {
      return Left(Exception('Failed to fetch videos: $e'));
    }
  }
}
