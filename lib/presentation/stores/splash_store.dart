import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store {
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUseCase =
      GetIt.I.get<GetUserIdSharedPreferencesUseCase>();
  var logger = Logger();
  @observable
  bool isAuthenticated = false;

  @observable
  bool isLoading = true;

  @action
  Future<void> initializeApp() async {
    await Future.delayed(Duration(seconds: 3));
    final hasUser = await _getUserIdSharedPreferencesUseCase();
    isAuthenticated = hasUser != null;
    isLoading = false;
  }
}
