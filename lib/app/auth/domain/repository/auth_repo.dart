import 'package:blog/app/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> login({required String email, required String password});
  void logout();
}
