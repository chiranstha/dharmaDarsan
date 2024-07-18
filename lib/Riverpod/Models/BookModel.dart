// ignore_for_file: file_names
import 'package:hive_flutter/hive_flutter.dart';
part 'BookModel.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDescription;

  @HiveField(3)
  dynamic image;
  @HiveField(4)
  String bookType;
  @HiveField(5)
  String id;

  BookModel({
    required this.name,
    required this.shortDescription,
    this.image,
    required this.bookType,
    required this.id,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        name: json["name"],
        shortDescription: json["shortDescription"],
        image: json["image"],
        bookType: json["bookType"],
        id: json["id"],
      );
}
