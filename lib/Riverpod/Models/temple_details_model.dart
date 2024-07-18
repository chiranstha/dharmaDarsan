import 'package:hive_flutter/hive_flutter.dart';
part 'temple_details_model.g.dart';

@HiveType(typeId: 17)
class Item extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int stateId;
  @HiveField(3)
  int districtId;
  @HiveField(4)
  int municipalityId;
  @HiveField(5)
  String address;
  @HiveField(6)
  String shortDescription;
  @HiveField(7)
  dynamic description;
  @HiveField(8)
  String phone;
  @HiveField(9)
  String priest;

  Item({
    required this.id,
    required this.name,
    required this.stateId,
    required this.districtId,
    required this.municipalityId,
    required this.address,
    required this.shortDescription,
    this.description,
    required this.phone,
    required this.priest,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        stateId: json["stateId"],
        districtId: json["districtId"],
        municipalityId: json["municipalityId"],
        address: json["address"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        phone: json["phone"],
        priest: json["priest"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateId": stateId,
        "districtId": districtId,
        "municipalityId": municipalityId,
        "address": address,
        "shortDescription": shortDescription,
        "description": description,
        "phone": phone,
        "priest": priest,
      };
}
