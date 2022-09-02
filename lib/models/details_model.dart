import 'package:meta/meta.dart';
import 'dart:convert';

Details detailsFromMap(String str) => Details.fromMap(json.decode(str));

String detailsToMap(Details data) => json.encode(data.toMap());

class Details {
  Details({
    required this.datas,
    required this.status,
    required this.messages,
  });

  final List<Data> datas;
  final bool status;
  final dynamic messages;

  factory Details.fromMap(Map<String, dynamic> json) => Details(
        datas: List<Data>.from(json["datas"].map((x) => Data.fromMap(x))),
        status: json["status"],
        messages: json["messages"],
      );

  Map<String, dynamic> toMap() => {
        "datas": List<dynamic>.from(datas.map((x) => x.toMap())),
        "status": status,
        "messages": messages,
      };
}

class Data {
  Data({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.title,
    required this.hour,
    required this.person,
    required this.calorie,
    required this.subtitle,
    required this.recipe,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  final int id;
  final int categoryId;
  final String image;
  final String title;
  final String hour;
  final String person;
  final String calorie;
  final String subtitle;
  final String recipe;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category category;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        categoryId: json["category_id"],
        image: json["image"],
        title: json["title"],
        hour: json["hour"],
        person: json["person"],
        calorie: json["calorie"],
        subtitle: json["subtitle"],
        recipe: json["recipe"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Category.fromMap(json["category"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "image": image,
        "title": title,
        "hour": hour,
        "person": person,
        "calorie": calorie,
        "subtitle": subtitle,
        "recipe": recipe,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toMap(),
      };
}

class Category {
  Category({
    required this.id,
    required this.image,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String image;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"],
        categoryName: json["category_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "category_name": categoryName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
