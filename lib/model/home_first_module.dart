// To parse this JSON data, do
//
//     final homeFirst = homeFirstFromJson(jsonString);

import 'dart:convert';

List<HomeFirst> homeFirstFromJson(String str) => List<HomeFirst>.from(json.decode(str).map((x) => HomeFirst.fromJson(x)));

String homeFirstToJson(List<HomeFirst> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeFirst {
  HomeFirst({
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

  factory HomeFirst.fromJson(Map<String, dynamic> json) => HomeFirst(
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
