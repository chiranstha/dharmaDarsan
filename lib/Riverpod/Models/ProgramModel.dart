// ignore_for_file: file_names
import 'package:hive_flutter/hive_flutter.dart';
part 'ProgramModel.g.dart';

@HiveType(typeId: 8)
class ProgramModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String dateMiti;
  @HiveField(2)
  String location;
  @HiveField(3)
  String name;
  @HiveField(4)
  String shortDescription;
  @HiveField(5)
  dynamic image;
  @HiveField(6)
  String description;

  ProgramModel({
    required this.id,
    required this.dateMiti,
    required this.location,
    required this.name,
    required this.shortDescription,
    this.image,
    required this.description,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json["id"],
        dateMiti: json["dateMiti"],
        location: json["location"],
        name: json["name"],
        shortDescription: json["shortDescription"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateMiti": dateMiti,
        "location": location,
        "name": name,
        "shortDescription": shortDescription,
        "image": image,
        "description": description,
      };
}
