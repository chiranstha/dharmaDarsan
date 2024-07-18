// ignore_for_file: file_names

class RadioModel {
  RadioModel({
    required this.id,
    required this.title,
    required this.frequency,
    required this.desc,
    required this.logo,
    required this.streamUrl,
    required this.province,
    required this.views,
  });

  int id;
  String title;
  String frequency;
  String desc;
  String logo;
  String streamUrl;
  int province;
  int views;

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        id: json["id"],
        title: json["title"],
        frequency: json["frequency"],
        desc: json["desc"],
        logo: json["logo"],
        streamUrl: json["stream_url"],
        province: json["province"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "frequency": frequency,
        "desc": desc,
        "logo": logo,
        "stream_url": streamUrl,
        "province": province,
        "views": views,
      };
}
