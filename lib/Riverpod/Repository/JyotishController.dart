// ignore_for_file: file_names

import 'dart:convert';
import 'package:hamro_patro/Riverpod/Models/jyotishmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../config.dart';
import '../dio.dart';

class JyotishController {
  Future<List<JyotishModel>> getJyotish() async {
    const url = "/api/services/app/Android/GetAllAstrologers";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => JyotishModel.fromJson(data)).toList();
    } catch (e) {
      List<JyotishModel> a = [];
      return a;
    }
  }

  Future<JyotishModel?> getJyotishdetails(String id) async {
    final url = "/api/services/app/Android/GetAstrologerForView?id=$id";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())['result'];

      var data = JyotishModel.fromJson(value);

      return data;
    } catch (e) {
      return null;
    }
  }
}

final jyotishProvider =
    Provider<JyotishController>((ref) => JyotishController());
