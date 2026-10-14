
import 'package:blog/app/blog/domain/entity/blog_entity.dart';


class Blog extends BlogEntity {
  Blog({
    required super.title,
    required super.author,
    required super.data,
    required super.content,
    required super.isPublished,
    required super.likes,
    required super.dislikes,
    required super.numberOfReads,
    required super.duration,
  });

  factory Blog.fromJson(Map<String,dynamic> j){
    return Blog(
      title: j['title'], 
      author: j['author'], 
      data: j['data'], 
      content: j['content'], 
      isPublished: j['isPublished'], 
      likes: j['likes'], 
      dislikes: j['dislikes'], 
      numberOfReads: j['numberOfReads'], 
      duration: j['duration']);
  }
}
