import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:loomi_player/domain/usecases/get_type_account_usecases.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecases/get_user_firestore_usecase.dart';
import '../../domain/usecases/delete_user_firestore_usecase.dart';
import '../../data/models/user_model.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUseCase =
      GetIt.I<GetUserIdSharedPreferencesUseCase>();
  final GetUserFirestoreUseCase _getUserFirestoreUseCase =
      GetIt.I<GetUserFirestoreUseCase>();
  final DeleteUserFirestoreUseCase _deleteUserFirestoreUseCase =
      GetIt.I<DeleteUserFirestoreUseCase>();
  final GetTypeAccountUsecases _getTypeAccountUsecases =
      GetIt.I<GetTypeAccountUsecases>();
  var logger = Logger();

  @observable
  UserModel? user;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> getUser() async {
    try {
      isLoading = true;
      final userId = await _getUserIdSharedPreferencesUseCase();
      if (userId == null) return;
      final userData = await _getUserFirestoreUseCase(userId);

      if (userData != null) {
        user = UserModel.fromJson(userData);
      } else {
        user = null;
      }
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Error getting user';
      logger.d("Error getting user: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> deleteUser() async {
    try {
      isLoading = true;
      final uid = await _getUserIdSharedPreferencesUseCase();
      if (uid == null) return false;
      await _deleteUserFirestoreUseCase(uid);
      user = null;
      errorMessage = null;
      return true;
    } catch (e) {
      errorMessage = 'Error deleting user';
      logger.d("Error deleting user: $e");
    } finally {
      isLoading = false;
    }
    return false;
  }

  @action
  Future<void> clearUser() async {
    isLoading = true;
    await _getUserIdSharedPreferencesUseCase();
    isLoading = false;
  }

  @action
  Future<bool> getTypeAccount() async {
    try {
      isLoading = true;
      return await _getTypeAccountUsecases();
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
