import 'package:blog/app/blog/presentation/bloc/blog_event.dart';
import 'package:blog/app/blog/presentation/bloc/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(InitialBlogState());
}
