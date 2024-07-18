// ignore_for_file: file_names
import 'package:hamro_patro/Riverpod/Models/sait_details_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'SaitModel.g.dart';

@HiveType(typeId: 13)
class SaitModel extends HiveObject {
  @HiveField(0)
  String category;
  @HiveField(1)
  List<Site> sites;

  SaitModel({
    required this.category,
    required this.sites,
  });

  factory SaitModel.fromJson(Map<String, dynamic> json) => SaitModel(
        category: json["category"],
        sites: List<Site>.from(json["sites"].map((x) => Site.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "sites": List<dynamic>.from(sites.map((x) => x.toJson())),
      };
}
