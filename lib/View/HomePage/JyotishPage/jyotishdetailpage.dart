// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Models/jyotishmodel.dart';
import 'package:hamro_patro/Riverpod/Repository/JyotishController.dart';
import 'package:hamro_patro/View/HomePage/ProgramPage/eventpage.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
// import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:url_launcher/url_launcher.dart' as up;
import 'package:url_launcher/url_launcher.dart';
import '../../../Widgets/constants.dart';

class JyotishDetailPage extends ConsumerStatefulWidget {
  JyotishDetailPage({required this.id, super.key});
  String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JyotishDetailPageState();
}

class _JyotishDetailPageState extends ConsumerState<JyotishDetailPage> {
  JyotishModel? details;
  getinitdata() async {
    final dw = await ref.read(jyotishProvider).getJyotishdetails(widget.id);
    if (mounted) {
      setState(() {
        details = dw;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getinitdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("ज्योतिष विवरण"),
          backgroundColor: mainColor,
        ),
        body: details == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          !details!.photo.toString().startsWith('/')
                              ? Container(
                                  height: 16.w,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/dharmadarshan.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 16.w,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: MemoryImage(
                                        base64Decode(details!.photo.toString()),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          horizontalSpace(width: 10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                details!.name,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              verticalSpace(height: 4),
                              Text(details!.qualification,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ))
                            ],
                          ))
                        ],
                      ),
                      verticalSpace(height: 20),
                      InkWell(
                        onTap: () {
                          FlutterPhoneDirectCaller.callNumber(
                              details!.contact.toString());
                        },
                        child: Row(
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.w),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/call.svg",
                                      height: 7.w,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      details!.contact,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(height: 5),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              try {
                                await launch(
                                  details!.youtubeLink,
                                );
                              } catch (e) {
                                // An exception is thrown if browser app is not installed on Android device.
                                debugPrint(e.toString());
                              }
                            },
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.w),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/utube.svg",
                                      height: 7.w,
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    const Text("youtube"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(width: 12),
                          InkWell(
                            onTap: () async {
                              try {
                                await launch(
                                  details!.faceBookLink,
                                );
                              } catch (e) {
                                // An exception is thrown if browser app is not installed on Android device.
                                debugPrint(e.toString());
                              }
                            },
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.w),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/facebook.svg",
                                      height: 7.w,
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    const Text("facebook"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(width: 12),
                          InkWell(
                            onTap: () async {
                              final uri = Uri(
                                scheme: 'mailto',
                                path: details!.email,
                              );
                              up.launchUrl(uri);
                            },
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.w),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/gmail.svg",
                                      height: 7.w,
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    const Text("E-mail"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(height: 20),
                      Text(
                        details!.shortDescription.trim(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpace(height: 10),
                      Text(
                        details!.description,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
