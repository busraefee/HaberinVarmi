// To parse this JSON data, do
//
//     final homeSecond = homeSecondFromJson(jsonString);

import 'dart:convert';

List<HomeSecond> homeSecondFromJson(String str) => List<HomeSecond>.from(json.decode(str).map((x) => HomeSecond.fromJson(x)));

String homeSecondToJson(List<HomeSecond> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeSecond {
  HomeSecond({
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

  factory HomeSecond.fromJson(Map<String, dynamic> json) => HomeSecond(
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
