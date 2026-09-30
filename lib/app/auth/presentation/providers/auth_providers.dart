import 'package:blog/app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:blog/app/auth/data/repoInterface/auth_repo_interface.dart';
// import 'package:blog/app/auth/domain/repository/auth_repo.dart';
import 'package:blog/app/auth/domain/usecase/auth_repo_usecase.dart';
import 'package:blog/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final authDataPoviders = [
  Provider<AuthRemoteDatasource>(create: (_) => AuthRemoteDatasource()),
  Provider<AuthRepoInterface>(
    create: (context) => AuthRepoInterface(
      remoteDataSource: context.read<AuthRemoteDatasource>(),
    ),
  ),
];

final List<SingleChildWidget> authDomainProvider = [
  Provider<LoginUseCase>(
    create: (context) => LoginUseCase(context.read<AuthRepoInterface>()),
  ),
];

final List<SingleChildWidget> authBlocProviders = [
  BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(loginUseCase: context.read<LoginUseCase>()),
  ),
];
