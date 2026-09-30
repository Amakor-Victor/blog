part of 'auth_bloc.dart';


sealed class AuthEvent {}

final class RequestLogin extends AuthEvent {
  final String email;
  final String password;

  RequestLogin({required this.email, required this.password});
}
