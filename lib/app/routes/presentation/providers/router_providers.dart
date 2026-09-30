import 'dart:async';
import 'package:blog/app/auth/domain/entity/user_entity.dart';
import 'package:blog/app/auth/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends AsyncNotifier<UserEntity?> {
  @override
  FutureOr<UserEntity?> build() => null;

  Future<void> login({required String email, required String password}) async {
    try {
      state = const AsyncValue.loading();
      final user = await ref
          .read(loginUseCaseProvider)
          .login(email: email, password: password);
      state = AsyncValue.data(user);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, UserEntity?>(() {
      return AuthController();
    });

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<UserEntity?>>(
      authControllerProvider,
      (_, __) => notifyListeners(),
    );
  }
}
