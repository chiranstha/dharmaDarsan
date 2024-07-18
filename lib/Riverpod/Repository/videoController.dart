import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/VideoModel.dart';
import '../Models/categorymodel.dart';
import '../config.dart';
import '../dio.dart';

class VideoController {
  Future<List<CategoryModel>> getallcategory() async {
    const url = "/api/services/app/PatroVideoCategories/GetAll";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => CategoryModel.fromJson(data)).toList();
    } catch (e) {
      List<CategoryModel> a = [];
      return a;
    }
  }

  Future<List<VideoModel>> getallVideos() async {
    const url = "/api/services/app/PatroFrontend/GetAllPatroVedio";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => VideoModel.fromJson(data)).toList();
    } catch (e) {
      List<VideoModel> a = [];
      return a;
    }
  }
}

final videoProvider = Provider<VideoController>((ref) => VideoController());
