// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

List<Detail> detailFromJson(String str) => List<Detail>.from(json.decode(str).map((x) => Detail.fromJson(x)));

String detailToJson(List<Detail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Detail {
  Detail({
    this.postId,
    this.catId,
    this.title,
    this.description,
    this.image,
    this.video,
    this.date,
    this.type,
    this.content,
    this.gallery,
  });

  String postId;
  String catId;
  String title;
  String description;
  String image;
  String video;
  DateTime date;
  String type;
  String content;
  dynamic gallery;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    postId: json["postId"],
    catId: json["catId"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    video: json["video"],
    date: DateTime.parse(json["date"]),
    type: json["type"],
    content: json["content"],
    gallery: json["gallery"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "catId": catId,
    "title": title,
    "description": description,
    "image": image,
    "video": video,
    "date": date.toIso8601String(),
    "type": type,
    "content": content,
    "gallery": gallery,
  };
}
