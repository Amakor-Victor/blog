import 'package:blog/app/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
 const UserModel({
    required super.email,
    required super.id,
    required super.isActive,
    required super.role,
    required super.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> j) {
    return UserModel(
      email: j['email'],
      id: j['id'],
      isActive: j['isActive'],
      role: j['role'],
      username: j['username'],
    );
  }
}
