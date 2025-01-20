import 'package:get_it/get_it.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/domain/usecases/get_videos_usecase.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetVideosUseCase getVideosUseCase;
  final GetUserFirestoreUseCase _getUserFirestoreUseCase =
      GetIt.I<GetUserFirestoreUseCase>();
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUseCase =
      GetIt.I<GetUserIdSharedPreferencesUseCase>();
  HomeStoreBase({required this.getVideosUseCase}) {
    fetchVideos();
  }

  @observable
  ObservableList<VideoEntity> videos = ObservableList<VideoEntity>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  UserModel? user;

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
      errorMessage = 'Error : $e';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<UserModel?> getUser() async {
    isLoading = true;
    final uid = await _getUserIdSharedPreferencesUseCase.call();
    if (uid == null) return null;
    final userRemote = await _getUserFirestoreUseCase(uid);
    user = UserModel.fromJson(userRemote ?? {});
    isLoading = false;
    return user;
  }
}
