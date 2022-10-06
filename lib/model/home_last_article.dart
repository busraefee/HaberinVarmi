// To parse this JSON data, do
//
//     final homeLastArticle = homeLastArticleFromJson(jsonString);

import 'dart:convert';

List<HomeLastArticle> homeLastArticleFromJson(String str) => List<HomeLastArticle>.from(json.decode(str).map((x) => HomeLastArticle.fromJson(x)));

String homeLastArticleToJson(List<HomeLastArticle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeLastArticle {
  HomeLastArticle({
    this.postId,
    this.authorName,
    this.title,
    this.image,
  });

  String postId;
  String authorName;
  String title;
  String image;

  factory HomeLastArticle.fromJson(Map<String, dynamic> json) => HomeLastArticle(
    postId: json["postId"],
    authorName: json["authorName"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "authorName": authorName,
    "title": title,
    "image": image,
  };
}
