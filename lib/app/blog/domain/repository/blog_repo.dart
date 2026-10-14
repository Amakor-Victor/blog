import 'package:blog/app/blog/domain/entity/blog_entity.dart';

abstract class BlogRepo {
  Future<List<BlogEntity?>> fetchBlog();
}