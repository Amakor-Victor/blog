import 'package:blog/app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:blog/app/auth/data/models/user_model.dart';
import 'package:blog/app/auth/domain/repository/auth_repo.dart';
import 'package:blog/app/auth/domain/entity/user_entity.dart';

class AuthRepoInterface implements AuthRepo {
  final AuthRemoteDatasource remoteDataSource;

  AuthRepoInterface({required this.remoteDataSource});
  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    final user = UserModel.fromJson(response);

    return user;
  }

  @override
  void logout() async {}
}
