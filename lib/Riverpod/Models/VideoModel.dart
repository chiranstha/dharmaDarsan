import 'package:hamro_patro/Riverpod/Models/video_details_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'VideoModel.g.dart';

@HiveType(typeId: 18)
class VideoModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<VedioDetail> vedioDetail;

  VideoModel({
    required this.name,
    required this.vedioDetail,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        name: json["name"],
        vedioDetail: List<VedioDetail>.from(
            json["vedioDetail"].map((x) => VedioDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "vedioDetail": List<dynamic>.from(vedioDetail.map((x) => x.toJson())),
      };
}
