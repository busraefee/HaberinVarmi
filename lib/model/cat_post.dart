// To parse this JSON data, do
//
//     final catPost = catPostFromJson(jsonString);

import 'dart:convert';

List<CatPost> catPostFromJson(String str) => List<CatPost>.from(json.decode(str).map((x) => CatPost.fromJson(x)));

String catPostToJson(List<CatPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatPost {
  CatPost({
    this.postId,
    this.title,
    this.image,
    this.type,
  });

  String postId;
  String title;
  String image;
  String type;

  factory CatPost.fromJson(Map<String, dynamic> json) => CatPost(
    postId: json["postId"],
    title: json["title"],
    image: json["image"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "title": title,
    "image": image,
    "type": type,
  };
}
