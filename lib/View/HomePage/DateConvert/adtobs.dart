// ignore_for_file: unused_import, depend_on_referenced_packages, camel_case_types, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../../Widgets/calendar widget/widgets/widget_space.dart';
import '../../../Widgets/constants.dart';

class adtobspage extends StatefulWidget {
  const adtobspage({super.key});

  @override
  State<adtobspage> createState() => _adtobspageState();
}

class _adtobspageState extends State<adtobspage> {
  var monthselected = 1;

  var yearselected = 2023;

  dynamic convertedTime;

  dynamic day;

  List<String> dayslist = [];

  var dayselected = "01";

  @override
  void initState() {
    super.initState();
    dayslist = getdays();
  }

  List<String> getdays() {
    int day = DateTime(yearselected, monthselected + 1, 0).day;
    List<String> days = [];
    for (int i = 1; i <= day; i++) {
      days.add(i.toString().length == 1 ? "0$i" : "$i");
    }
    return days;
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
              items: englishYearList
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text((item.toString())),
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
                        items: englishMonths
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item == 1
                                        ? "January"
                                        : item == 2
                                            ? "February"
                                            : item == 3
                                                ? "March"
                                                : item == 4
                                                    ? "April"
                                                    : item == 5
                                                        ? "May"
                                                        : item == 6
                                                            ? "June"
                                                            : item == 7
                                                                ? "July"
                                                                : item == 8
                                                                    ? "August"
                                                                    : item == 9
                                                                        ? "September"
                                                                        : item ==
                                                                                10
                                                                            ? "October"
                                                                            : item == 11
                                                                                ? "November"
                                                                                : item == 12
                                                                                    ? "December"
                                                                                    : "",
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (yearselected != null) {
                            setState(() {
                              dayselected = "01";
                              monthselected = value!;
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
                                  child: Text((item.toString())),
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
                  final ms = monthselected.toString().length == 1
                      ? "0$monthselected"
                      : "$monthselected";
                  String date = "$yearselected-$ms-$dayselected";

                  DateTime nepaliDateTime = DateTime.parse(date);
                  final dwd = nepaliDateTime.toNepaliDateTime();
                  final nepalidate = NepaliDateFormat('MMMM dd, yyyy')
                      .format(NepaliDateTime.parse(dwd.toString()));
                  //get day of week
                  final dayofweek = NepaliDateFormat.EEEE()
                      .format(NepaliDateTime.parse(dwd.toString()));
                  setState(() {
                    convertedTime = nepalidate;
                    day = dayofweek;
                  });
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
