import 'package:blog/app/auth/domain/entity/user_entity.dart';
import 'package:blog/app/auth/domain/usecase/auth_repo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  AuthBloc({required this._loginUseCase}) : super(AuthInitial()) {
    on<RequestLogin>((event, emit) async {
      emit(AuthLoading());

      try {
        final UserEntity user = await _loginUseCase.login(
          email: event.email,
          password: event.password,
        );
        await Future.delayed(
          const Duration(seconds: 2),
          () => emit(AuthSuccess(user: user)),
        );
      } catch (e) {
        emit(AuthError(error: e.toString()));
      }
    });
  }
}
