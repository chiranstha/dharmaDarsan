import 'package:hive_flutter/hive_flutter.dart';
part 'weekly_rasifal_model.g.dart';

@HiveType(typeId: 10)
class WeeklyRasifalModel extends HiveObject {
  @HiveField(0)
  int weekNumber;
  @HiveField(1)
  int year;
  @HiveField(2)
  String description;
  @HiveField(3)
  String rashi;
  @HiveField(4)
  int rashiEnum;
  @HiveField(5)
  int dayNumber;
  @HiveField(6)
  String id;

  WeeklyRasifalModel(
      {required this.weekNumber,
      required this.year,
      required this.description,
      required this.rashi,
      required this.rashiEnum,
      required this.dayNumber,
      required this.id});

  factory WeeklyRasifalModel.fromJson(Map<String, dynamic> json) =>
      WeeklyRasifalModel(
        weekNumber: json["weekNumber"],
        year: json["year"],
        description: json["description"],
        rashi: json["rashi"],
        rashiEnum: json["rashiEnum"],
        dayNumber: json["dayNumber"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "weekNumber": weekNumber,
        "year": year,
        "description": description,
        "rashi": rashi,
        "rashiEnum": rashiEnum,
        "dayNumber": dayNumber,
        "id": id,
      };
}
