// ignore_for_file: depend_on_referenced_packages, camel_case_types, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../../Widgets/calendar widget/widgets/widget_space.dart';
import '../../../Widgets/constants.dart';

class bstoadpage extends StatefulWidget {
  const bstoadpage({super.key});

  @override
  State<bstoadpage> createState() => _bstoadpageState();
}

class _bstoadpageState extends State<bstoadpage> {
  var monthselected = "01";

  var yearselected = 2080;

  dynamic convertedTime;

  dynamic day;

  List<String> dayslist = [];

  var dayselected = "01";

  List<String> getdays() {
    int day = NepaliDateTime.parse("$yearselected-$monthselected-01").totalDays;
    List<String> days = [];
    for (int i = 1; i <= day; i++) {
      days.add(i.toString().length == 1 ? "0$i" : "$i");
    }
    return days;
  }

  @override
  void initState() {
    super.initState();
    dayslist = getdays();
  }

  @override
  Widget build(BuildContext context) {
    // print(dayselected);
    // print(getdays());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'वर्ष',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          verticalSpace(height: 5),
          DropdownButtonFormField(
              decoration: InputDecoration(
                isDense: true,
                fillColor: Colors.grey,
                hintText: "वर्ष छान्नुहोस",
                hintStyle: const TextStyle(
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: yearselected,
              items: yearList
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(NepaliUnicode.convert(item.toString())),
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
          verticalSpace(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "महिना",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    verticalSpace(height: 5),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Colors.grey,
                          hintText: "महिना छान्नुहोस",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                                                                        : item ==
                                                                                "10"
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
              SizedBox(
                width: 6.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "गते",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    verticalSpace(height: 5),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Colors.grey,
                          // labelText: "गते छान्नुहोस",
                          // labelStyle: const TextStyle(
                          //   fontSize: 20,
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: dayselected,
                        items: dayslist
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                      NepaliUnicode.convert(item.toString())),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            dayselected = value.toString();
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(height: 20),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFdb1304)),
                onPressed: () {
                  if (dayselected != null &&
                      monthselected != null &&
                      yearselected != null) {
                    String date = "$yearselected-$monthselected-$dayselected";

                    NepaliDateTime nepaliDateTime = NepaliDateTime.parse(date);
                    DateTime englishDate = nepaliDateTime.toDateTime();
                    final dw = DateFormat('MMMM dd, yyyy').format(englishDate);
                    //get day of week
                    final dayOfWeek = DateFormat('EEEE').format(englishDate);
                    setState(() {
                      convertedTime = dw;
                      day = dayOfWeek;
                    });
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "परिवर्तन गर्नुहोस",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
          ),
          // Text(
          //   convertedTime == null ? "" : convertedTime,
          //   style: TextStyle(
          //     fontSize: 20,
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: secondColor),
            ),
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: convertedTime == null || day == null
                    ? Text(
                        "मिति छान्नुहोस्",
                        style: TextStyle(fontSize: 25, color: secondColor),
                      )
                    : Column(
                        children: [
                          Text(
                            convertedTime,
                            style: TextStyle(fontSize: 25, color: secondColor),
                          ),
                          verticalSpace(height: 10),
                          Text(
                            day,
                            style: TextStyle(fontSize: 25, color: secondColor),
                          ),
                        ],
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
