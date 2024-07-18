import 'package:hive_flutter/hive_flutter.dart';
part 'MantraModel.g.dart';

@HiveType(typeId: 7)
class MantraModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  int mantraType;
  @HiveField(3)
  String mantraTypeString;
  @HiveField(4)
  dynamic readingTime;
  @HiveField(5)
  String id;

  MantraModel({
    required this.name,
    required this.description,
    required this.mantraType,
    required this.mantraTypeString,
    this.readingTime,
    required this.id,
  });

  factory MantraModel.fromJson(Map<String, dynamic> json) => MantraModel(
        name: json["name"],
        description: json["description"],
        mantraType: json["mantraType"],
        mantraTypeString: json["mantraTypeString"],
        readingTime: json["readingTime"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "mantraType": mantraType,
        "mantraTypeString": mantraTypeString,
        "readingTime": readingTime,
        "id": id,
      };
}
