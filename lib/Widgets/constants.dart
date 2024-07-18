import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

var darkblack = Colors.black.withOpacity(0.5);
var darkwhite = Colors.white.withOpacity(0.8);
var mainColor = const Color(0xFFdb1304);
var secondColor = const Color(0xFFb25a38);

List<String> months = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
];

List<int> englishMonths = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
];

List<int> generateYearList() {
  List<int> yearList = [];
  for (int year = 2000; year <= 2090; year++) {
    yearList.add(year);
  }
  return yearList;
}

List<int> yearList = generateYearList();

List<int> generateenglishYearList() {
  List<int> yearList = [];
  for (int year = 1920; year <= 2040; year++) {
    yearList.add(year);
  }
  return yearList;
}

List<int> englishYearList = generateenglishYearList();

showtoast(String message) {
  Fluttertoast.showToast(
      msg: message, textColor: Colors.white, backgroundColor: Colors.red);
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
