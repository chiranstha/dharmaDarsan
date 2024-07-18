// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hamro_patro/Riverpod/Models/TodayRasifalModel.dart';
import 'package:hamro_patro/Riverpod/Repository/RasifalController.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../Widgets/constants.dart';

class WeeklyRasifalPage extends ConsumerStatefulWidget {
  WeeklyRasifalPage(
      {required this.description, required this.indexr, super.key});
  String? description;
  int indexr;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeeklyRasifalPageState();
}

class _WeeklyRasifalPageState extends ConsumerState<WeeklyRasifalPage> {
  bool isOn = false;
  Future<int?> getweeknumber(String date) async {
    final datess = await ref.read(rasifalProvider).getweekdate(date);
    return datess;
  }

  var yearselected = NepaliDateTime.now().year;
  var monthselected = NepaliDateTime.now().month.toString().length == 1
      ? "0${NepaliDateTime.now().month}"
      : NepaliDateTime.now().month.toString();
  var dayselected = NepaliDateTime.now().day.toString().length == 1
      ? "0${NepaliDateTime.now().day}"
      : NepaliDateTime.now().day.toString();
  List<String> dayslist = [];
  List<String> getdays() {
    int day = NepaliDateTime.parse("$yearselected-$monthselected-01").totalDays;
    List<String> days = [];
    for (int i = 1; i <= day; i++) {
      days.add(i.toString().length == 1 ? "0$i" : "$i");
    }
    return days;
  }

  getinitdata() async {
    final weekdate =
        await getweeknumber("$yearselected/$monthselected/$dayselected");
    final dw = await ref
        .read(rasifalProvider)
        .getweeklybydaterasifal(weekdate!, yearselected);

    setState(() {
      widget.description = dw
              .where((element) {
                return element.rashiEnum == widget.indexr;
              })
              .toList()
              .isNotEmpty
          ? dw
              .where((element) {
                return element.rashiEnum == widget.indexr;
              })
              .first
              .description
          : "राशिफल उपलब्ध छैन";
    });
  }

  @override
  void initState() {
    super.initState();

    dayslist = getdays();
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   yearselected = NepaliDateTime.now().year;
    // });

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'वर्ष',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      DropdownButtonFormField(
                          decoration: const InputDecoration(
                            isDense: true,
                          ),
                          value: yearselected,
                          items: yearList
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                        NepaliUnicode.convert(item.toString())),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              yearselected = value as int;
                            });

                            if (monthselected != null) {
                              setState(() {
                                dayslist = getdays();
                              });
                            }
                          }),
                    ],
                  ),
                ),
                horizontalSpace(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "महिना",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      DropdownButtonFormField(
                          decoration: const InputDecoration(
                            isDense: true,
                          ),
                          value: monthselected,
                          items: months
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item == "01"
                                          ? "बैशाख"
                                          : item == "02"
                                              ? "जेठ"
                                              : item == "03"
                                                  ? "असार"
                                                  : item == "04"
                                                      ? "साउन"
                                                      : item == "05"
                                                          ? "भदौ"
                                                          : item == "06"
                                                              ? "असोज"
                                                              : item == "07"
                                                                  ? "कार्तिक"
                                                                  : item == "08"
                                                                      ? "मंसिर"
                                                                      : item ==
                                                                              "09"
                                                                          ? "पुष"
                                                                          : item == "10"
                                                                              ? "माघ"
                                                                              : item == "11"
                                                                                  ? "फाल्गुन"
                                                                                  : item == "12"
                                                                                      ? "चैत्र"
                                                                                      : "अन्य",
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (yearselected != null) {
                              setState(() {
                                dayselected = "01";
                                monthselected = value.toString();
                                dayslist = getdays();

                                // List<int> dwd = getdays();
                                // bool isgreater = dwd.length < dayslist.length;
                                // if (isgreater) {
                                //   dayslist = [];
                                // }
                                // dayslist = dwd;
                              });
                            }
                          })
                    ],
                  ),
                ),
                horizontalSpace(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "गते",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      DropdownButtonFormField(
                          decoration: const InputDecoration(
                            isDense: true,
                          ),
                          value: dayselected,
                          items: dayslist
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                        NepaliUnicode.convert(item.toString())),
                                  ))
                              .toList(),
                          onChanged: (value) async {
                            final weekdate = await getweeknumber(
                                "$yearselected/$monthselected/$value");
                            final dw = await ref
                                .read(rasifalProvider)
                                .getweeklybydaterasifal(
                                    weekdate!, yearselected);

                            setState(() {
                              widget.description = null;
                              dayselected = value.toString();
                              widget.description = dw
                                      .where((element) {
                                        return element.rashiEnum ==
                                            widget.indexr;
                                      })
                                      .toList()
                                      .isNotEmpty
                                  ? dw
                                      .where((element) {
                                        return element.rashiEnum ==
                                            widget.indexr;
                                      })
                                      .first
                                      .description
                                  : "राशिफल उपलब्ध छैन";
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(height: 20),
            widget.description == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                :  HtmlWidget(
              widget.description.toString(),
              textStyle: TextStyle(
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
