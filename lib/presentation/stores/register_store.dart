import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../core/services/auth_service.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final AuthService _authService = GetIt.I<AuthService>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> register(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      await _authService.createUser(email, password);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
