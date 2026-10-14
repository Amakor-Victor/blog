import 'package:blog/app/blog/data/datasource/blog_remote_data_source.dart';
import 'package:blog/app/blog/domain/entity/blog_entity.dart';
import 'package:blog/app/blog/domain/repository/blog_repo.dart';

class BlogRepoImpl extends BlogRepo {
  final BlogRemoteDataSource _blogRemoteDataSource;

  BlogRepoImpl({required this._blogRemoteDataSource});
  @override
  Future<List<BlogEntity?>> fetchBlog() async {
    final blogs = await _blogRemoteDataSource.fetchBlog();

    return blogs;
  }
}
