import 'package:hive_flutter/hive_flutter.dart';
part 'jyotishmodel.g.dart';

@HiveType(typeId: 6)
class JyotishModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String contact;
  @HiveField(3)
  String shortDescription;
  @HiveField(4)
  dynamic photo;
  @HiveField(5)
  String description;
  @HiveField(6)
  dynamic qualification;
  @HiveField(7)
  String email;
  @HiveField(8)
  String faceBookLink;
  @HiveField(9)
  String youtubeLink;

  JyotishModel({
    required this.id,
    required this.name,
    required this.contact,
    required this.shortDescription,
    this.photo,
    required this.description,
    this.qualification,
    required this.email,
    required this.faceBookLink,
    required this.youtubeLink,
  });

  factory JyotishModel.fromJson(Map<String, dynamic> json) => JyotishModel(
        id: json["id"],
        name: json["name"],
        contact: json["contact"],
        shortDescription: json["shortDescription"],
        photo: json["photo"],
        description: json["description"],
        qualification: json["qualification"],
        email: json["email"],
        faceBookLink: json["faceBookLink"],
        youtubeLink: json["youtubeLink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact": contact,
        "shortDescription": shortDescription,
        "photo": photo,
        "description": description,
        "qualification": qualification,
        "email": email,
        "faceBookLink": faceBookLink,
        "youtubeLink": youtubeLink,
      };
}
