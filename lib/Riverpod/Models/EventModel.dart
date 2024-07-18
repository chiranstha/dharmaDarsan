import 'package:hive_flutter/hive_flutter.dart';
part 'EventModel.g.dart';

@HiveType(typeId: 5)
class EventModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String dateMiti;
  @HiveField(2)
  String name;
  @HiveField(3)
  bool isHoliday;
  @HiveField(4)
  String sunrise;
  @HiveField(5)
  String sunset;
  @HiveField(6)
  int remainingDays;

  EventModel({
    required this.id,
    required this.dateMiti,
    required this.name,
    required this.isHoliday,
    required this.sunrise,
    required this.sunset,
    required this.remainingDays,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        dateMiti: json["dateMiti"],
        name: json["name"],
        isHoliday: json["isHoliday"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        remainingDays: json["remainingDays"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateMiti": dateMiti,
        "name": name,
        "isHoliday": isHoliday,
        "sunrise": sunrise,
        "sunset": sunset,
        "remainingDays": remainingDays,
      };
}
