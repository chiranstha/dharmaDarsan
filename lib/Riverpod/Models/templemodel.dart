import 'package:hamro_patro/Riverpod/Models/temple_details_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'templemodel.g.dart';

@HiveType(typeId: 16)
class TempleModel extends HiveObject {
  @HiveField(0)
  int totalCount;
  @HiveField(1)
  List<Item> items;

  TempleModel({
    required this.totalCount,
    required this.items,
  });

  factory TempleModel.fromJson(Map<String, dynamic> json) => TempleModel(
        totalCount: json["totalCount"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
