// ignore_for_file: file_names
import 'package:hive_flutter/hive_flutter.dart';
part 'BlogModel.g.dart';

@HiveType(typeId: 1)
class BlogModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDescription;
  @HiveField(2)
  String description;
  @HiveField(3)
  String slug;
  @HiveField(4)
  String content;
  @HiveField(5)
  dynamic metaKeyboard;
  @HiveField(6)
  dynamic metaDescription;
  @HiveField(7)
  bool isPublished;
  @HiveField(8)
  String blogCategoryName;
  @HiveField(9)
  dynamic dateMiti;
  @HiveField(10)
  dynamic date;
  @HiveField(11)
  dynamic imageByte;
  @HiveField(12)
  String id;

  BlogModel({
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.slug,
    required this.content,
    this.metaKeyboard,
    this.metaDescription,
    required this.isPublished,
    required this.blogCategoryName,
    this.dateMiti,
    this.date,
    this.imageByte,
    required this.id,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        name: json["name"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        slug: json["slug"],
        content: json["content"],
        metaKeyboard: json["metaKeyboard"],
        metaDescription: json["metaDescription"],
        isPublished: json["isPublished"],
        blogCategoryName: json["blogCategoryName"],
        dateMiti: json["dateMiti"],
        // date: DateTime.parse(json["date"]),
        imageByte: json["imageByte"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "shortDescription": shortDescription,
        "description": description,
        "slug": slug,
        "content": content,
        "metaKeyboard": metaKeyboard,
        "metaDescription": metaDescription,
        "isPublished": isPublished,
        "blogCategoryName": blogCategoryName,
        "dateMiti": dateMiti,
        "date": date.toIso8601String(),
        "imageByte": imageByte,
        "id": id,
      };
}
