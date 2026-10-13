// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Blog {
  String title;
  String author;
  DateTime data;
  String content;
  String isPublished;
  int likes;
  String dislikes;

  Blog({
    required this.title,
    required this.author,
    required this.data,
    required this.content,
    required this.isPublished,
    required this.likes,
    required this.dislikes,
  });

  Blog copyWith({
    String? title,
    String? author,
    DateTime? data,
    String? content,
    String? isPublished,
    int? likes,
    String? dislikes,
  }) {
    return Blog(
      title: title ?? this.title,
      author: author ?? this.author,
      data: data ?? this.data,
      content: content ?? this.content,
      isPublished: isPublished ?? this.isPublished,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'data': data.millisecondsSinceEpoch,
      'content': content,
      'isPublished': isPublished,
      'likes': likes,
      'dislikes': dislikes,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      title: map['title'] as String,
      author: map['author'] as String,
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      content: map['content'] as String,
      isPublished: map['isPublished'] as String,
      likes: map['likes'] as int,
      dislikes: map['dislikes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Blog(title: $title, author: $author, data: $data, content: $content, isPublished: $isPublished, likes: $likes, dislikes: $dislikes)';
  }

  @override
  bool operator ==(covariant Blog other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.author == author &&
      other.data == data &&
      other.content == content &&
      other.isPublished == isPublished &&
      other.likes == likes &&
      other.dislikes == dislikes;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      data.hashCode ^
      content.hashCode ^
      isPublished.hashCode ^
      likes.hashCode ^
      dislikes.hashCode;
  }
}
