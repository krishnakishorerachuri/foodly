// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  String id;
  String title;
  String time;
  List<String> foodTags;
  List<String?> foodType;
  int code;
  bool isAvailable;
  String category;
  List<String> imageUrl;
  String restaurant;
  double rating;
  String ratingCount;
  String description;
  List<Additive> additives;
  double price;

  FoodModel({
    required this.id,
    required this.title,
    required this.time,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.category,
    required this.imageUrl,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.additives,
    required this.price,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    id: json["_id"],
    title: json["title"],
    time: json["time"],
    foodTags: List<String>.from(json["foodTags"].map((x) => x)),
    foodType: List<String?>.from(json["foodType"].map((x) => x)),
    code: json["code"],
    isAvailable: json["isAvailable"],
    category: json["category"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    restaurant: json["restaurant"],
    rating: json["rating"]?.toDouble(),
    ratingCount: json["ratingCount"],
    description: json["description"],
    additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "time": time,
    "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
    "foodType": List<dynamic>.from(foodType.map((x) => x)),
    "code": code,
    "isAvailable": isAvailable,
    "category": category,
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    "restaurant": restaurant,
    "rating": rating,
    "ratingCount": ratingCount,
    "description": description,
    "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
    "price": price,
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
