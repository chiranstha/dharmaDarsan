// ignore_for_file: file_names

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/SaitModel.dart';
import '../config.dart';
import '../dio.dart';

class SaitController {
  Future<List<SaitModel>> getSaits() async {
    const url = "/api/services/app/Site/GetSiteByYearList";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => SaitModel.fromJson(data)).toList();
    } catch (e) {
      List<SaitModel> a = [];
      return a;
    }
  }
}

final saitProvider = Provider<SaitController>((ref) => SaitController());
