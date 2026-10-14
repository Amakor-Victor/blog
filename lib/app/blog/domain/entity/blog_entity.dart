// ignore_for_file: public_member_api_docs, sort_constructors_first
class BlogEntity {
  String title;
  String author;
  DateTime data;
  String content;
  bool isPublished;
  int likes;
  int dislikes;
  int numberOfReads;
  String duration;
  BlogEntity({
    required this.title,
    required this.author,
    required this.data,
    required this.content,
    required this.isPublished,
    required this.likes,
    required this.dislikes,
    required this.numberOfReads,
    required this.duration,
  });
}
