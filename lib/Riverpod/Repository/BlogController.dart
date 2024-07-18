import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/BlogModel.dart';
import '../config.dart';
import '../dio.dart';

class BlogController {
  Future<List<BlogModel>> getBlogs(int skipCount, int maxResultCount) async {
    final url =
        "/api/services/app/Android/GetAllBlogs?SkipCount=$skipCount&MaxResultCount=$maxResultCount";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => BlogModel.fromJson(data)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<BlogModel?> getbookdetails(String id) async {
    final url = "/api/services/app/Android/GetBlogForView?id=$id";

    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())['result'];

      var data = BlogModel.fromJson(value);

      return data;
    } catch (e) {
      return null;
    }
  }
}

final blogProvider = Provider<BlogController>((ref) => BlogController());
