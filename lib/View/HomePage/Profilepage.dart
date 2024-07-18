// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as up;

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: secondColor,
                        radius: 15.5.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage("assets/images/guru.png"),
                          radius: 14.5.w,
                        ),
                      ),
                      horizontalSpace(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "कुबेर सुवेदी",
                              style: TextStyle(
                                  color: secondColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                            verticalSpace(height: 2),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: Colors.blueGrey,
                                ),
                                horizontalSpace(width: 5),
                                Expanded(
                                  child: Text(
                                    NepaliUnicode.convert("9841234567"),
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        // fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  color: Colors.blueGrey,
                                ),
                                horizontalSpace(width: 5),
                                Expanded(
                                  child: Text(
                                    "kubersubedi@gmail.com",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                )
                              ],
                            ),
                            verticalSpace(height: 2),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blueGrey,
                                ),
                                horizontalSpace(width: 5),
                                Expanded(
                                  child: Text(
                                    "काठमाडौं, नेपाल",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        try {
                          await launch(
                            "https://www.youtube.com/@dharmadarshan8528",
                          );
                        } catch (e) {
                          // An exception is thrown if browser app is not installed on Android device.
                          debugPrint(e.toString());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border(
                          //     bottom: BorderSide(color: Colors.grey, width: 2)),
                          border: Border.all(color: secondColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            SvgPicture.asset(
                              "assets/images/utube.svg",
                              height: 6.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Youtube",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    horizontalSpace(width: 10),
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        try {
                          await launch(
                            "https://www.facebook.com/kathavyaskubersubedi/",
                          );
                        } catch (e) {
                          // An exception is thrown if browser app is not installed on Android device.
                          debugPrint(e.toString());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border(
                          //     bottom: BorderSide(color: Colors.grey, width: 2)),
                          border: Border.all(color: secondColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            SvgPicture.asset(
                              "assets/images/facebook.svg",
                              height: 6.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    horizontalSpace(width: 10),
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        final uri = Uri(
                          scheme: 'mailto',
                          path: "kubersubedi@gmail.com",
                        );
                        up.launchUrl(uri);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border(
                          //     bottom: BorderSide(color: Colors.grey, width: 2)),
                          border: Border.all(color: secondColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            SvgPicture.asset(
                              "assets/images/gmail.svg",
                              height: 6.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "E-mail",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.w),
                child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // border: Border(
                              //     bottom: BorderSide(color: Colors.grey, width: 2))
                              border: Border.all(color: secondColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: .5.w),
                              child: Text(
                                "परिचय",
                                style: TextStyle(
                                    color: secondColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                          verticalSpace(height: 5),
                          Text(
                            "आज २०८० बैशाख २१ गते Australia काे Tasmania मा बिर्ख बहादुर थापा भिम माया थापा सहित सम्पूर्ण थापा परिवार हरुकाे निजी निवासमा श्रीमद्भागवत सप्ताह समापन, अन्तराष्ट्रिय रुपमा नेपाल बाट संगीतमय कथा Live प्रस्तुति कार्यक्रमकाे लागि गायक राजु अधिकारी,रङ्गनाथ खनाल,निशेष सुवेदी हाम्राे टिमलाई निमन्त्रणा गरेर भागवत सप्ताह महापुराण खड्ग थापा सहित वहांका सम्पूर्ण दाजु भाऊजु आफान्त आत्मियजनहरुले  स्नेह सद्भावले धेरै अपार प्रेम सम्मान दिनु भयो यसको लागि सदैव वन्दनिय स्मरणिय हुनुहुन्छ । सम्पूर्ण थापा परिवार सहित तास्मनियाका नेपाली मनहरु प्रति आभार धन्यबाद साधुवाद ।",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.black,

                                // fontWeight: FontWeight.w500,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
