// To parse this JSON data, do
//
//     final recoContent = recoContentFromJson(jsonString);

import 'dart:convert';

List<RecoContent> recoContentFromJson(String str) => List<RecoContent>.from(json.decode(str).map((x) => RecoContent.fromJson(x)));

String recoContentToJson(List<RecoContent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecoContent {
  RecoContent({
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

  factory RecoContent.fromJson(Map<String, dynamic> json) => RecoContent(
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
