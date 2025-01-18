import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/services/auth_service.dart';
import 'package:loomi_player/core/services/firestore_service.dart';
import 'package:loomi_player/data/repositories/auth_repository_impl.dart';
import 'package:loomi_player/data/repositories/firestore_user_repository_impl.dart';
import 'package:loomi_player/data/repositories/user_repository.dart';
import 'package:loomi_player/data/repositories/video_repository_impl.dart';
import 'package:loomi_player/data/sources/video_api.dart';
import 'package:loomi_player/domain/repositories/video_repository.dart';
import 'package:loomi_player/domain/usecases/clear_user_usecase.dart';
import 'package:loomi_player/domain/usecases/delete_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:loomi_player/domain/usecases/get_videos_usecase.dart';
import 'package:loomi_player/domain/usecases/login_with_email_password_usecase.dart';
import 'package:loomi_player/domain/usecases/login_with_google_usecase.dart';
import 'package:loomi_player/domain/usecases/logout_usecase.dart';
import 'package:loomi_player/domain/usecases/register_with_username_password_usecase.dart';
import 'package:loomi_player/domain/usecases/reset_password_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:loomi_player/domain/usecases/save_user_id_shared_preferences_usecase.dart';
import 'package:loomi_player/presentation/stores/forgot_password_store.dart';
import 'package:loomi_player/presentation/stores/home_store.dart';
import 'package:loomi_player/presentation/stores/login_store.dart';
import 'package:loomi_player/presentation/stores/profile_store.dart';
import 'package:loomi_player/presentation/stores/register_profile_store.dart';
import 'package:loomi_player/presentation/stores/register_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();

  // Services
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());

  // APIs
  getIt.registerLazySingleton<VideoApi>(() => VideoApi(dio));

  // Repositories
  getIt.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(api: getIt<VideoApi>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(sharedPreferences),
  );
  getIt.registerLazySingleton<FirestoreUserRepositoryImpl>(
    () => FirestoreUserRepositoryImpl(getIt<FirestoreService>()),
  );
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(getIt<AuthService>()),
  );

  // Use Cases
  getIt.registerLazySingleton<SaveUserIdSharedPreferencesUseCase>(
    () => SaveUserIdSharedPreferencesUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<GetUserIdSharedPreferencesUseCase>(
    () => GetUserIdSharedPreferencesUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<ClearUserIdSharedPreferencesUseCase>(
    () => ClearUserIdSharedPreferencesUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<GetVideosUseCase>(
    () => GetVideosUseCase(getIt<VideoRepository>()),
  );
  getIt.registerLazySingleton<SaveUserFirestoreUseCase>(
    () => SaveUserFirestoreUseCase(getIt<FirestoreUserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetUserFirestoreUseCase>(
    () => GetUserFirestoreUseCase(getIt<FirestoreUserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<DeleteUserFirestoreUseCase>(
    () => DeleteUserFirestoreUseCase(getIt<FirestoreUserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(getIt<AuthRepositoryImpl>()),
  );
  getIt.registerLazySingleton<RegisterWithUsernamePasswordUseCase>(
    () => RegisterWithUsernamePasswordUseCase(getIt<AuthRepositoryImpl>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(getIt<AuthRepositoryImpl>()));

  getIt.registerLazySingleton<LoginWithEmailPasswordUseCase>(
      () => LoginWithEmailPasswordUseCase(getIt<AuthRepositoryImpl>()));

  getIt.registerLazySingleton<ResetPasswordUsecase>(
      () => ResetPasswordUsecase(getIt<AuthRepositoryImpl>()));

  // Stores
  getIt.registerLazySingleton<LoginStore>(() => LoginStore());
  getIt.registerLazySingleton<ForgotPasswordStore>(() => ForgotPasswordStore());
  getIt.registerLazySingleton<RegisterStore>(() => RegisterStore());
  getIt.registerLazySingleton<RegisterProfileStore>(
      () => RegisterProfileStore());
  getIt.registerLazySingleton<HomeStore>(
    () => HomeStore(getVideosUseCase: getIt<GetVideosUseCase>()),
  );
  getIt.registerLazySingleton<ProfileStore>(
    () => ProfileStore(
      getIt<SaveUserFirestoreUseCase>(),
      getIt<GetUserFirestoreUseCase>(),
      getIt<DeleteUserFirestoreUseCase>(),
    ),
  );
}
