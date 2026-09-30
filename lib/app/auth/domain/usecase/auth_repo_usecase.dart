import 'package:blog/app/auth/domain/repository/auth_repo.dart';
import 'package:blog/app/auth/domain/entity/user_entity.dart';

class LoginUseCase {
  final AuthRepo _repoInterface;

  const LoginUseCase(this._repoInterface);

  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    return await _repoInterface.login(email: email, password: password);
  }
}
