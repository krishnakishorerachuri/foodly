// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

List<Food> foodFromJson(String str) => List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  String id;
  String title;
  List<String> foodTags;
  List<String?> foodType;
  String code;
  bool isAvailable;
  String restaurant;
  double rating;
  String ratingCount;
  String description;
  double price;
  List<Additive> additives;
  String imageUrl;
  int v;
  String category;
  String time;

  Food({
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
    required this.v,
    required this.category,
    required this.time,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["_id"],
    title: json["title"],
    foodTags: List<String>.from(json["foodTags"].map((x) => x)),
    foodType: List<String?>.from(json["foodType"].map((x) => x)),
    code: json["code"],
    isAvailable: json["isAvailable"],
    restaurant: json["restaurant"],
    rating: json["rating"]?.toDouble(),
    ratingCount: json["ratingCount"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
    imageUrl: json["imageUrl"],
    v: json["__v"],
    category: json["category"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
    "foodType": List<dynamic>.from(foodType.map((x) => x)),
    "code": code,
    "isAvailable": isAvailable,
    "restaurant": restaurant,
    "rating": rating,
    "ratingCount": ratingCount,
    "description": description,
    "price": price,
    "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
    "imageUrl": imageUrl,
    "__v": v,
    "category": category,
    "time": time,
  };
}

class Additive {
  int id;
  String title;
  String price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
    id: json["id"],
    title: json["title"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
  };
}
