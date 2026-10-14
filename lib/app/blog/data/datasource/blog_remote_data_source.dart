import 'package:blog/app/blog/data/model/blog.dart';

class BlogRemoteDataSource {
  Future<List<Blog>> fetchBlog() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final List data = [{"":""}];
      final blogs = data.map((j)=>Blog.fromJson(j)).toList();
      return blogs;
    } catch (e) {
      throw  Exception(e.toString());
    }
  }
}
