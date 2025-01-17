import 'package:mobx/mobx.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/domain/usecases/get_videos_usecase.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetVideosUseCase getVideosUseCase;

  _HomeStoreBase({required this.getVideosUseCase}) {
    fetchVideos();
  }

  @observable
  ObservableList<VideoEntity> videos = ObservableList<VideoEntity>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> fetchVideos() async {
    isLoading = true;
    errorMessage = '';
    try {
      final result = await getVideosUseCase();
      result.fold(
        (error) {
          errorMessage = error.toString();
        },
        (videoList) {
          videos = ObservableList.of(videoList);
        },
      );
    } catch (e) {
      errorMessage = 'Erro inesperado: $e';
    } finally {
      isLoading = false;
    }
  }
}
