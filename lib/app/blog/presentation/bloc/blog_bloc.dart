import 'package:blog/app/blog/domain/usecase/fetch_blog_usecase.dart';
import 'package:blog/app/blog/presentation/bloc/blog_event.dart';
import 'package:blog/app/blog/presentation/bloc/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final FetchBlogUsecase _fetchBlogUsecase;
  BlogBloc({required this._fetchBlogUsecase}) : super(InitialBlogState()) {
    on<RequestMoreBlogEvent>((event, emit) async {
      try {
        
      } catch (e) {
        emit(FetchBlogErrorState());
      }
      emit(FetchBlogLoadingState());
      final blogs = await _fetchBlogUsecase.fetchBlog();
      emit(FetchBlogSuccessState(blogs: blogs));
    });
  }
}
