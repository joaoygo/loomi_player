import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
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
      errorMessage = 'Erro ao obter usuário';
      logger.d("Erro ao obter usuário: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> deleteUser(String uid) async {
    try {
      isLoading = true;
      await _deleteUserFirestoreUseCase(uid);
      user = null;
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Erro ao deletar usuário';
      logger.d("Erro ao deletar usuário: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> clearUser() async {
    isLoading = true;
    await _getUserIdSharedPreferencesUseCase();
    isLoading = false;
  }
}
