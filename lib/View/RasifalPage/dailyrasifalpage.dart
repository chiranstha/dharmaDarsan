// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hamro_patro/Riverpod/Models/TodayRasifalModel.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class DailyRasifalPage extends ConsumerStatefulWidget {
  DailyRasifalPage({required this.description, required this.date, super.key});
  String date;
  String description;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DailyRasifalPageState();
}

class _DailyRasifalPageState extends ConsumerState<DailyRasifalPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NepaliUnicode.convert(widget.date.toString()),
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 1.h,
          ),
          HtmlWidget(
              widget.description.toString(),
              textStyle: TextStyle(
                fontSize: 13.sp,
              ),
            ),
        ],
      ),
    ));
  }
}
