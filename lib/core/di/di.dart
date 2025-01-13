import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/services/auth_service.dart';
import 'package:loomi_player/data/repositories/user_repository.dart';
import 'package:loomi_player/domain/usecases/clear_user_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_usecase.dart';
import 'package:loomi_player/presentation/stores/forgot_password_store.dart';
import 'package:loomi_player/presentation/stores/login_store.dart';
import 'package:loomi_player/presentation/stores/register_profile_store.dart';
import 'package:loomi_player/presentation/stores/register_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<UserRepository>(
    UserRepository(sharedPreferences),
  );

  getIt.registerSingleton<AuthService>(AuthService());

  getIt.registerSingleton<SaveUserUseCase>(
    SaveUserUseCase(getIt<UserRepository>()),
  );

  getIt.registerSingleton<GetUserUseCase>(
    GetUserUseCase(getIt<UserRepository>()),
  );

  getIt.registerSingleton<ClearUserUseCase>(
    ClearUserUseCase(getIt<UserRepository>()),
  );

  getIt.registerSingleton<LoginStore>(LoginStore());
  getIt.registerSingleton<ForgotPasswordStore>(ForgotPasswordStore());
  getIt.registerSingleton<RegisterStore>(RegisterStore());
  getIt.registerSingleton<RegisterProfileStore>(RegisterProfileStore());
}
