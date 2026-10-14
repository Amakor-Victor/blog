import 'package:blog/app/blog/data/datasource/blog_remote_data_source.dart';
import 'package:blog/app/blog/data/interface/blog_repo_impl.dart';
import 'package:blog/app/blog/domain/repository/blog_repo.dart';
import 'package:blog/app/blog/domain/usecase/fetch_blog_usecase.dart';
import 'package:blog/app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> blogSourceProvider = [
  Provider<BlogRemoteDataSource>(create: (_) => BlogRemoteDataSource()),
  Provider<BlogRepo>(
    create: (context) => BlogRepoImpl(
      blogRemoteDataSource: context.read<BlogRemoteDataSource>(),
    ),
  ),
];
List<SingleChildWidget> blogDomainProvider = [
  Provider<FetchBlogUsecase>(
    create: (context) => FetchBlogUsecase(blogRepo: context.read<BlogRepo>()),
  ),
];

List<SingleChildWidget> blogBlocProvider = [
  BlocProvider<BlogBloc>(
    create: (context) =>
        BlogBloc(fetchBlogUsecase: context.read<FetchBlogUsecase>()),
  ),
];
// List<SingleChildWidget>
