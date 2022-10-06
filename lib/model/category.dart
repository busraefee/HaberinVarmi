// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.catId,
    this.catName,
    this.subcategory,
  });

  String catId;
  String catName;
  List<Subcategory> subcategory;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    catId: json["catId"],
    catName: json["catName"],
    subcategory: List<Subcategory>.from(json["subcategory"].map((x) => Subcategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
  };
}

class Subcategory {
  Subcategory({
    this.catId,
    this.catName,
  });

  String catId;
  String catName;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    catId: json["catId"],
    catName: json["catName"],
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
  };
}
