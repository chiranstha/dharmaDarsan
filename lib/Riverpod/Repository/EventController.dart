import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/EventModel.dart';
import '../config.dart';
import '../dio.dart';

class EventController {
  Future<List<EventModel>> getEvents() async {
    const url = "/api/services/app/Android/GetLatestEvents";
    final box = Hive.box<EventModel>('event');
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];
      final returnData = data.map((data) => EventModel.fromJson(data)).toList();
      for (var element in returnData) {
        final existingData = box.values.any((e) => e.id == element.id);

        if (!existingData) {
          box.add(element);
        }
      }
      return returnData;
    } catch (e) {
      return box.values.toList();
    }
  }

  Future<List<EventModel>> getEventsByMonth(String year, String month) async {
    final url =
        "/api/services/app/Event/GetEventsByMonth?year=$year&month=$month";

    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => EventModel.fromJson(data)).toList();
    } catch (e) {
      return [];
    }
  }
}

final eventProvider = Provider<EventController>((ref) => EventController());
