part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class RequestLogin extends AuthEvent {
  final String email;
  final String password;

  const RequestLogin({required this.email, required this.password});
}
