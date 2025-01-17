import 'package:logger/logger.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../core/services/auth_service.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final AuthService _authService = GetIt.I<AuthService>();
  var logger = Logger();
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<UserModel?> register(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      final newUser = await _authService.createUser(email, password);
      logger.d("User created: $newUser");
      final userModel = UserModel(
        uid: newUser!.uid,
        email: newUser.email ?? '',
        name: newUser.displayName ?? '',
        photoUrl: newUser.photoURL ?? '',
      );
      return userModel;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
    return null;
  }
}
