import 'package:blog/app/blog/domain/entity/blog_entity.dart';
import 'package:blog/app/blog/domain/repository/blog_repo.dart';

class FetchBlogUsecase {
  final BlogRepo _blogRepo;
  const FetchBlogUsecase({required this._blogRepo});

  Future<List<BlogEntity?>> fetchBlog() async {
    return _blogRepo.fetchBlog();
  }
}
