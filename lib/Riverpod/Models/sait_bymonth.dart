import 'package:hive_flutter/hive_flutter.dart';
part 'sait_bymonth.g.dart';

@HiveType(typeId: 14)
class ByMonth extends HiveObject {
  @HiveField(0)
  String dateMiti;
  @HiveField(1)
  String description;
  @HiveField(2)
  String dateOnly;

  ByMonth({
    required this.dateMiti,
    required this.description,
    required this.dateOnly,
  });

  factory ByMonth.fromJson(Map<String, dynamic> json) => ByMonth(
        dateMiti: json["dateMiti"],
        description: json["description"],
        dateOnly: json["dateOnly"],
      );

  Map<String, dynamic> toJson() => {
        "dateMiti": dateMiti,
        "description": description,
        "dateOnly": dateOnly,
      };
}
