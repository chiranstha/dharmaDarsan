import 'package:hamro_patro/Riverpod/Models/day_details.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'calendarmodel.g.dart';

@HiveType(typeId: 2)
class CalendarModel extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  dynamic tithi;
  @HiveField(2)
  List<DayDetail> dayDetails;

  CalendarModel({
    required this.date,
    required this.tithi,
    required this.dayDetails,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        date: json["date"],
        tithi: json["tithi"],
        dayDetails: List<DayDetail>.from(
            json["dayDetails"].map((x) => DayDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "tithi": tithi,
        "dayDetails": List<dynamic>.from(dayDetails.map((x) => x.toJson())),
      };
}
