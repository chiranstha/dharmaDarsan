import 'package:hive_flutter/hive_flutter.dart';
part 'video_details_model.g.dart';

@HiveType(typeId: 19)
class VedioDetail extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDescription;
  @HiveField(2)
  String description;
  @HiveField(3)
  String vedioLink;
  @HiveField(4)
  String patroVideoCategoryName;

  VedioDetail({
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.vedioLink,
    required this.patroVideoCategoryName,
  });

  factory VedioDetail.fromJson(Map<String, dynamic> json) => VedioDetail(
        name: json["name"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        vedioLink: json["vedioLink"],
        patroVideoCategoryName: json["patroVideoCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "shortDescription": shortDescription,
        "description": description,
        "vedioLink": vedioLink,
        "patroVideoCategoryName": patroVideoCategoryName,
      };
}
