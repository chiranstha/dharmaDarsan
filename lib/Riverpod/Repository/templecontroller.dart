import 'dart:convert';

import 'package:hamro_patro/Riverpod/Models/templemodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/temple_details_model.dart';
import '../config.dart';
import '../dio.dart';

class TempleController {
  Future<TempleModel?> gettemples() async {
    const url = "/api/services/app/Temple/GetAll";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())['result'];

      var data = TempleModel.fromJson(value);

      return data;
    } catch (e) {
      return null;
    }
  }

  Future<Item?> gettempledetails(String id) async {
    final url = "/api/services/app/Temple/GetTempleForView?id=$id";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );
      if (response.statusCode == 200) {
        var value = json.decode(response.toString())['result'];

        var data = Item.fromJson(value);

        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

final templeProvider = Provider<TempleController>((ref) => TempleController());
