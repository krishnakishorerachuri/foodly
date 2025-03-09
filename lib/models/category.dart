import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  String id;
  String title;
  String value;
  String imageUrl;

  Category({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    title: json["title"],
    value: json["value"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "value": value,
    "imageUrl": imageUrl,
  };
}
