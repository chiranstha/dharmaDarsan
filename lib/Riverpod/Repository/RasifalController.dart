// ignore_for_file: file_names
import 'dart:convert';
import 'package:hamro_patro/Riverpod/Models/TodayRasifalModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/monthly_rasifal_model.dart';
import '../Models/weekly_rasifal_model.dart';
import '../Models/yearly_rasifal_model.dart';
import '../config.dart';
import '../dio.dart';

class RasifalRepo {
  Future<List<TodayRasifalModel>> gettodayrasifal() async {
    const url = "/api/services/app/Android/GetTodayRashifal";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => TodayRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<TodayRasifalModel> a = [];
      return a;
    }
  }

  Future<List<MonthRasifalModel>> getmonthlyrasifal() async {
    const url = "/api/services/app/Android/GetMonthlyRashifal";

    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => MonthRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<MonthRasifalModel> a = [];
      return a;
    }
  }

  Future<List<WeeklyRasifalModel>> getweeklyrasifal() async {
    const url = "/api/services/app/Android/GetWeeklyRashfal";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => WeeklyRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<WeeklyRasifalModel> a = [];
      return a;
    }
  }

  Future<List<WeeklyRasifalModel>> getweeklybydaterasifal(
      int weekid, int year) async {
    final url =
        "/api/services/app/Android/GetWeeklyRashfalByWeek?weekid=$weekid&year=$year";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => WeeklyRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<WeeklyRasifalModel> a = [];
      return a;
    }
  }

  Future<int?> getweekdate(String date) async {
    final url = "/api/services/app/Android/GetWeekNumber?date=$date";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      var value = json.decode(response.toString())["result"];

      return value;
    } catch (e) {
      return null;
    }
  }

  Future<List<MonthRasifalModel>> getmonthlybydaterasifal(
      int year, String month) async {
    final url =
        "/api/services/app/Android/GetRashifalByMonth?year=$year&month=$month";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => MonthRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<MonthRasifalModel> a = [];
      return a;
    }
  }

  Future<List<YearlyRasifalModel>> getyearlyrasifal() async {
    const url = "/api/services/app/Android/GetAllYearlyRashifal";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => YearlyRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<YearlyRasifalModel> a = [];
      return a;
    }
  }

  Future<List<YearlyRasifalModel>> getyearlybydaterasifal(int year) async {
    final url = "/api/services/app/Android/GetYearDataByYear?year=$year";
    try {
      final response = await Api().get(
        MyConfig.appUrl + url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => YearlyRasifalModel.fromJson(data)).toList();
    } catch (e) {
      List<YearlyRasifalModel> a = [];
      return a;
    }
  }
}

final rasifalProvider = Provider<RasifalRepo>((ref) => RasifalRepo());
