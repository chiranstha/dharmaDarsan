// ignore_for_file: file_names, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:hamro_patro/View/HomePage/homefeatures.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import 'carouselpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: darkwhite,
          body: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(height: 5),
                const Crousal(),
                verticalSpace(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.h),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            // color: Color(0xFFdb1304),
                            border: Border.all(color: darkwhite, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFdb1304),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 1.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        "आज",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        NepaliDateFormat.yMMMMEEEEd(
                                                Language.nepali)
                                            .format(NepaliDateTime.now()),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    verticalSpace(height: 5),
                                    Text(
                                        DateFormat('MMMM dd, yyyy')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: darkblack,
                                            fontWeight: FontWeight.w500)),
                                    verticalSpace(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 3.h,
                                          width: 2.w,
                                          color: const Color(0xFFdb1304),
                                        ),
                                        horizontalSpace(width: 10),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                            NepaliUnicode.convert(
                                                "Aja Sanibar ho tesai le sabai lai xutti xa yo din ma                               grown"),
                                            style: TextStyle(
                                                color: darkblack,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(height: 10),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.h),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: darkwhite,
                                              radius: 6.w,
                                              child: const Text("आज"),
                                            ),
                                            horizontalSpace(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  NepaliUnicode.convert(
                                                      "Kaaal yog "),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  NepaliUnicode.convert(
                                                      "nirman ma sabai vanda agagai kaaal yog"),
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: darkblack),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      verticalSpace(height: 15),
                      homefeatures(context),
                      verticalSpace(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// enum Days{
//   // "आइत",
//   // "सोम",
//   // "मंगल",
//   // "बुध",
//   // "बिही",
//   // "शुक्र",
//   // "शनि"
// }

class DateModel {
  int? date;
  String? day;

  DateModel({this.date, this.day});
}


// List<Widget> dad =  [

// ]