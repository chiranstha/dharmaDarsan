// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hamro_patro/Riverpod/Models/TodayRasifalModel.dart';
import 'package:hamro_patro/Riverpod/Repository/RasifalController.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../Widgets/calendar widget/widgets/widget_space.dart';
import '../../Widgets/constants.dart';

class YearlyRasifalPage extends ConsumerStatefulWidget {
  YearlyRasifalPage(
      {required this.description, required this.indexr, super.key});
  String description;
  int indexr;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YearlyRasifalPageState();
}

class _YearlyRasifalPageState extends ConsumerState<YearlyRasifalPage> {
  int yearselected = NepaliDateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'वर्ष',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                  ),
                  value: yearselected,
                  items: yearList
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(NepaliUnicode.convert(item.toString())),
                          ))
                      .toList(),
                  onChanged: (value) async {
                    final dw = await ref
                        .read(rasifalProvider)
                        .getyearlybydaterasifal(value as int);
                    setState(() {
                      yearselected = value;
                      widget.description = dw
                              .where((element) {
                                return element.rashi == widget.indexr;
                              })
                              .toList()
                              .isNotEmpty
                          ? dw
                              .where((element) {
                                return element.rashi == widget.indexr;
                              })
                              .first
                              .description
                          : "राशिफल उपलब्ध छैन";
                    });
                  }),
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
