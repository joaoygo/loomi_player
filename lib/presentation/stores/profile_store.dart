import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecases/get_user_firestore_usecase.dart';
import '../../domain/usecases/delete_user_firestore_usecase.dart';
import '../../data/models/user_model.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final SaveUserFirestoreUseCase _saveUserFirestoreUseCase;
  final GetUserFirestoreUseCase _getUserFirestoreUseCase;
  final DeleteUserFirestoreUseCase _deleteUserFirestoreUseCase;

  _ProfileStore(
    this._saveUserFirestoreUseCase,
    this._getUserFirestoreUseCase,
    this._deleteUserFirestoreUseCase,
  );

  @observable
  UserModel? user;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> saveUser(UserModel userModel) async {
    try {
      isLoading = true;
      await _saveUserFirestoreUseCase(userModel.uid, userModel.toJson());
      user = userModel;
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Erro ao salvar usuário';
      print("Erro ao salvar usuário: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getUser(String uid) async {
    try {
      isLoading = true;
      final userData = await _getUserFirestoreUseCase(uid);

      if (userData != null) {
        user = UserModel.fromJson(userData);
      } else {
        user = null;
      }
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Erro ao obter usuário';
      print("Erro ao obter usuário: $e");
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
      print("Erro ao deletar usuário: $e");
    } finally {
      isLoading = false;
    }
  }
}
