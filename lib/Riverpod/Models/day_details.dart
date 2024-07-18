import 'package:hive_flutter/hive_flutter.dart';
part 'day_details.g.dart';

@HiveType(typeId: 3)
class DayDetail extends HiveObject {
  @HiveField(0)
  String description;

  DayDetail({
    required this.description,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) => DayDetail(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
