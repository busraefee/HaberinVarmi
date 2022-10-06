// To parse this JSON data, do
//
//     final allAuthor = allAuthorFromJson(jsonString);

import 'dart:convert';

List<AllAuthor> allAuthorFromJson(String str) => List<AllAuthor>.from(json.decode(str).map((x) => AllAuthor.fromJson(x)));

String allAuthorToJson(List<AllAuthor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAuthor {
  AllAuthor({
    this.authorId,
    this.authorName,
    this.image,
  });

  String authorId;
  String authorName;
  String image;

  factory AllAuthor.fromJson(Map<String, dynamic> json) => AllAuthor(
    authorId: json["authorId"],
    authorName: json["authorName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "authorId": authorId,
    "authorName": authorName,
    "image": image,
  };
}
