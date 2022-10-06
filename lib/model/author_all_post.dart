// To parse this JSON data, do
//
//     final authorPost = authorPostFromJson(jsonString);

import 'dart:convert';

List<AuthorPost> authorPostFromJson(String str) => List<AuthorPost>.from(json.decode(str).map((x) => AuthorPost.fromJson(x)));

String authorPostToJson(List<AuthorPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthorPost {
  AuthorPost({
    this.authorId,
    this.authorName,
    this.authorImage,
    this.postId,
    this.title,
  });

  String authorId;
  String authorName;
  String authorImage;
  String postId;
  String title;

  factory AuthorPost.fromJson(Map<String, dynamic> json) => AuthorPost(
    authorId: json["authorId"],
    authorName: json["authorName"],
    authorImage: json["authorImage"],
    postId: json["postId"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "authorId": authorId,
    "authorName": authorName,
    "authorImage": authorImage,
    "postId": postId,
    "title": title,
  };
}
