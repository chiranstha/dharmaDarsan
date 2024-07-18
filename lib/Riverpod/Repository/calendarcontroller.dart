import 'dart:convert';
import 'package:hamro_patro/Riverpod/Models/calendarmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../config.dart';
import '../dio.dart';

class CalendarControllerRepo {
  Future<CalendarModel?> getdates(String date) async {
    final url = "/api/services/app/Android/GetDayDetails?dateMiti=$date";

    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())['result'];

      var data = CalendarModel.fromJson(value);

      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

final calendarProvider =
    Provider<CalendarControllerRepo>((ref) => CalendarControllerRepo());
