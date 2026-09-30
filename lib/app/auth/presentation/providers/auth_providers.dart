import 'package:blog/app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:blog/app/auth/data/repoInterface/auth_repo_interface.dart';
import 'package:blog/app/auth/domain/repository/auth_repo.dart';
import 'package:blog/app/auth/domain/usecase/auth_repo_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDatasource = Provider((ref){
  return AuthRemoteDatasource();
});

final authRepoProvider = Provider<AuthRepo>((ref){
  return AuthRepoInterface(remoteDataSource: ref.watch(authRemoteDatasource));
});

final loginUseCaseProvider = Provider((ref){
  return LoginUseCase(ref.watch(authRepoProvider));
});