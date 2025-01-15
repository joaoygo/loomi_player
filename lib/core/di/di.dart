import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/services/auth_service.dart';
import 'package:loomi_player/data/repositories/user_repository.dart';
import 'package:loomi_player/data/repositories/video_repository_impl.dart';
import 'package:loomi_player/data/sources/video_api.dart';
import 'package:loomi_player/domain/repositories/video_repository.dart';
import 'package:loomi_player/domain/usecases/clear_user_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_usecase.dart';
import 'package:loomi_player/domain/usecases/get_videos_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_usecase.dart';
import 'package:loomi_player/presentation/stores/forgot_password_store.dart';
import 'package:loomi_player/presentation/stores/login_store.dart';
import 'package:loomi_player/presentation/stores/register_profile_store.dart';
import 'package:loomi_player/presentation/stores/register_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();

  // API

  getIt.registerLazySingleton<VideoApi>(() => VideoApi(dio));

  // Repository

  getIt.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(api: getIt<VideoApi>()),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(sharedPreferences),
  );

  // Auth
  getIt.registerLazySingleton<AuthService>(() => AuthService());

  // Use Cases
  getIt.registerLazySingleton<SaveUserUseCase>(
    () => SaveUserUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<ClearUserUseCase>(
    () => ClearUserUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<GetVideosUseCase>(
    () => GetVideosUseCase(getIt<VideoRepository>()),
  );

  // Stores

  getIt.registerLazySingleton<LoginStore>(() => LoginStore());
  getIt.registerLazySingleton<ForgotPasswordStore>(() => ForgotPasswordStore());
  getIt.registerLazySingleton<RegisterStore>(() => RegisterStore());
  getIt.registerLazySingleton<RegisterProfileStore>(
      () => RegisterProfileStore());
}
