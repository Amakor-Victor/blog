import 'package:blog/app/blog/domain/entity/blog_entity.dart';

sealed class BlogState {
  const BlogState();
}

class InitialBlogState extends BlogState {}

class FetchBlogLoadingState extends BlogState {}

class FetchBlogErrorState extends BlogState {}

class FetchBlogSuccessState extends BlogState {
  List<BlogEntity?> blogs;
  FetchBlogSuccessState({required this.blogs});
}
