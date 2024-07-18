import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/BookModel.dart';
import '../config.dart';
import '../dio.dart';

class BookController {
  Future<List<BookModel>> getbooks(int id) async {
    final url = "/api/services/app/Android/GetAllBooks?booktype=$id";
    // final box = Hive.box<BookModel>('book');
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );
      print(response.realUri);

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];
      final returnData = data.map((e) => BookModel.fromJson(e)).toList();

      // for (var element in returnData) {
      //   final existingData = box.values.any((e) => e.id == element.id);

      //   if (!existingData) {
      //     box.add(element);
      //   }
      // }
      return returnData;
    } catch (e) {
      // return box.values.toList();
      rethrow;
    }
  }

  Future<BookModel?> getbookdetails(String id) async {
    final url = "/api/services/app/Book/GetBookForView?id=$id";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())['result'];

      var data = BookModel.fromJson(value);

      return data;
    } catch (e) {
      return null;
    }
  }
}

final bookServiceProvider = Provider<BookController>((ref) => BookController());

final bookProvider =
    FutureProvider.family<List<BookModel>, int>((ref, id) async {
  return ref.watch(bookServiceProvider).getbooks(id);
});

final bookHiveProvider = FutureProvider<List<BookModel>>((ref) async {
  final box = await Hive.openBox<BookModel>('book');
  return box.values.toList();
});
