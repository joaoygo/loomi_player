import 'package:loomi_player/domain/repositories/auth_repository.dart';

class GetTypeAccountUsecases {
  final AuthRepository _authRepository;

  GetTypeAccountUsecases(this._authRepository);

  Future<bool> call() => _authRepository.typeAccount();
}
