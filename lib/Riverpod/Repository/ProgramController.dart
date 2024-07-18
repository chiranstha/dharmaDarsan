// ignore_for_file: file_names
import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/ProgramModel.dart';
import '../config.dart';
import '../dio.dart';

class ProgramController {
  Future<List<ProgramModel>> getPrograms() async {
    const url = "/api/services/app/Program/GetAll";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => ProgramModel.fromJson(data)).toList();
    } catch (e) {
      List<ProgramModel> a = [];
      return a;
    }
  }

  Future<ProgramModel?> geteventdetails(String id) async {
    final url = "/api/services/app/Program/GetProgramForView?id=$id";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())['result'];

      var data = ProgramModel.fromJson(value);

      return data;
    } catch (e) {
      return null;
    }
  }
}

final programProvider =
    Provider<ProgramController>((ref) => ProgramController());
