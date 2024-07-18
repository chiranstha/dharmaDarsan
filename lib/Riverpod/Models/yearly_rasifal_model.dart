import 'package:hive_flutter/hive_flutter.dart';
part 'yearly_rasifal_model.g.dart';

@HiveType(typeId: 12)
class YearlyRasifalModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int year;
  @HiveField(2)
  String description;
  @HiveField(3)
  String rashi;
  @HiveField(4)
  int rashiEnum;

  YearlyRasifalModel({
    required this.id,
    required this.year,
    required this.description,
    required this.rashi,
    required this.rashiEnum,
  });

  factory YearlyRasifalModel.fromJson(Map<String, dynamic> json) =>
      YearlyRasifalModel(
        id: json["id"],
        year: json["year"],
        description: json["description"],
        rashi: json["rashi"],
        rashiEnum: json["rashiEnum"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "year": year,
        "description": description,
        "rashi": rashi,
      };
}
