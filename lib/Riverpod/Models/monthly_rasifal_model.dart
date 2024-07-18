import 'package:hive_flutter/hive_flutter.dart';
part 'monthly_rasifal_model.g.dart';

@HiveType(typeId: 11)
class MonthRasifalModel extends HiveObject {
  @HiveField(0)
  int month;
  @HiveField(1)
  int year;
  @HiveField(2)
  String description;
  @HiveField(3)
  String rashi;
  @HiveField(4)
  int rashiEnum;
  @HiveField(5)
  String id;

  MonthRasifalModel({
    required this.month,
    required this.year,
    required this.description,
    required this.rashi,
    required this.rashiEnum,
    required this.id,
  });

  factory MonthRasifalModel.fromJson(Map<String, dynamic> json) =>
      MonthRasifalModel(
        month: json["month"],
        year: json["year"],
        description: json["description"],
        rashi: json["rashi"],
        rashiEnum: json["rashiEnum"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "year": year,
        "description": description,
        "rashi": rashi,
        "rashiEnum": rashiEnum,
        "id": id,
      };
}
