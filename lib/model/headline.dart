// To parse this JSON data, do
//
//     final headline = headlineFromJson(jsonString);

import 'dart:convert';

List<Headline> headlineFromJson(String str) => List<Headline>.from(json.decode(str).map((x) => Headline.fromJson(x)));

String headlineToJson(List<Headline> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Headline {
  Headline({
    this.postId,
    this.catId,
    this.title,
    this.image,
    this.type,
  });

  String postId;
  String catId;
  String title;
  String image;
  String type;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
    postId: json["postId"],
    catId: json["catId"],
    title: json["title"],
    image: json["image"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "catId": catId,
    "title": title,
    "image": image,
    "type": type,
  };
}
