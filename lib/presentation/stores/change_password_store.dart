import 'package:get_it/get_it.dart';
import 'package:loomi_player/domain/usecases/change_password_usecases.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';

part 'change_password_store.g.dart';

class ChangePasswordStore = ChangePasswordStoreBase with _$ChangePasswordStore;

abstract class ChangePasswordStoreBase with Store {
  final ChangePasswordUsecases _changePasswordUsecases =
      GetIt.I<ChangePasswordUsecases>();
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUsecases =
      GetIt.I<GetUserIdSharedPreferencesUseCase>();

  @observable
  bool isLoading = false;

  @observable
  String currentPassword = '';

  @observable
  String newPassword = '';

  @observable
  String confirmPassword = '';

  @action
  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    try {
      isLoading = true;
      final email = await _getUserIdSharedPreferencesUsecases();
      if (email == null) return false;
      return await _changePasswordUsecases(email, currentPassword, newPassword);
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
