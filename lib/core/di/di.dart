import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/services/auth_service.dart';
import 'package:loomi_player/core/services/firestore_service.dart';
import 'package:loomi_player/data/repositories/firestore_user_repository_impl.dart';
import 'package:loomi_player/data/repositories/user_repository.dart';
import 'package:loomi_player/domain/usecases/clear_user_usecase.dart';
import 'package:loomi_player/domain/usecases/delete_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:loomi_player/domain/usecases/save_user_usecase.dart';
import 'package:loomi_player/presentation/stores/forgot_password_store.dart';
import 'package:loomi_player/presentation/stores/login_store.dart';
import 'package:loomi_player/presentation/stores/register_profile_store.dart';
import 'package:loomi_player/presentation/stores/register_store.dart';
import 'package:loomi_player/presentation/stores/profile_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(sharedPreferences),
  );
  getIt.registerLazySingleton<FirestoreUserRepositoryImpl>(
    () => FirestoreUserRepositoryImpl(getIt<FirestoreService>()),
  );

  // Auth
  getIt.registerLazySingleton<AuthService>(() => AuthService());

  // Firestore Service
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());

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
  getIt.registerLazySingleton<DeleteUserFirestoreUseCase>(
    () => DeleteUserFirestoreUseCase(getIt<FirestoreUserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetUserFirestoreUseCase>(
    () => GetUserFirestoreUseCase(getIt<FirestoreUserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<SaveUserFirestoreUseCase>(
    () => SaveUserFirestoreUseCase(getIt<FirestoreUserRepositoryImpl>()),
  );

  // Stores
  getIt.registerLazySingleton<LoginStore>(() => LoginStore());
  getIt.registerLazySingleton<ForgotPasswordStore>(() => ForgotPasswordStore());
  getIt.registerLazySingleton<RegisterStore>(() => RegisterStore());
  getIt.registerLazySingleton<RegisterProfileStore>(
      () => RegisterProfileStore());
  getIt.registerLazySingleton<ProfileStore>(
    () => ProfileStore(
      getIt<SaveUserFirestoreUseCase>(),
      getIt<GetUserFirestoreUseCase>(),
      getIt<DeleteUserFirestoreUseCase>(),
    ),
  );
}
