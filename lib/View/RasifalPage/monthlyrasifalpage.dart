// ignore_for_file: must_be_immutable, unnecessary_null_comparison, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hamro_patro/Riverpod/Repository/RasifalController.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../Widgets/calendar widget/widgets/widget_space.dart';
import '../../Widgets/constants.dart';

class MonthlyRasifalPage extends ConsumerStatefulWidget {
  MonthlyRasifalPage(
      {required this.description, required this.indexr, super.key});
  String description;
  int indexr;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MonthlyRasifalPageState();
}

class _MonthlyRasifalPageState extends ConsumerState<MonthlyRasifalPage> {
  int yearselected = NepaliDateTime.now().year;
  var monthselected = NepaliDateTime.now().month.toString().length == 1
      ? "0${NepaliDateTime.now().month}"
      : NepaliDateTime.now().month.toString();

  @override
  Widget build(BuildContext context) {
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
                          onChanged: (value) async {
                            if (yearselected != null) {
                              final dw = await ref
                                  .read(rasifalProvider)
                                  .getmonthlybydaterasifal(
                                      yearselected, value.toString());
                              setState(() {
                                monthselected = value.toString();
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
                            }
                          })
                    ],
                  ),
                ),
                horizontalSpace(width: 20),
              ],
            ),
            verticalSpace(height: 20),
             HtmlWidget(
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
