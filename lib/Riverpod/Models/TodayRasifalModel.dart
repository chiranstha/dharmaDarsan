// ignore_for_file: file_names

import 'package:hive_flutter/hive_flutter.dart';
part 'TodayRasifalModel.g.dart';

@HiveType(typeId: 9)
class TodayRasifalModel extends HiveObject {
  @HiveField(0)
  String dateMiti;
  @HiveField(1)
  String description;
  @HiveField(2)
  String rashi;
  @HiveField(3)
  int rashiEnum;
  @HiveField(4)
  String id;

  TodayRasifalModel({
    required this.dateMiti,
    required this.description,
    required this.rashi,
    required this.rashiEnum,
    required this.id,
  });

  factory TodayRasifalModel.fromJson(Map<String, dynamic> json) =>
      TodayRasifalModel(
        dateMiti: json["dateMiti"],
        description: json["description"],
        rashi: json["rashi"],
        rashiEnum: json["rashiEnum"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "dateMiti": dateMiti,
        "description": description,
        "rashi": rashi,
        "rashiEnum": rashiEnum,
        "id": id,
      };
}
