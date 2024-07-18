import 'package:hamro_patro/Riverpod/Models/sait_bymonth.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'sait_details_model.g.dart';

@HiveType(typeId: 15)
class Site extends HiveObject {
  @HiveField(0)
  int month;
  @HiveField(1)
  List<ByMonth> byMonths;

  Site({
    required this.month,
    required this.byMonths,
  });

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        month: json["month"],
        byMonths: List<ByMonth>.from(
            json["byMonths"].map((x) => ByMonth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "byMonths": List<dynamic>.from(byMonths.map((x) => x.toJson())),
      };
}
