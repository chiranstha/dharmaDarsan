import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Models/jyotishmodel.dart';
import 'package:hamro_patro/Riverpod/Repository/JyotishController.dart';
import 'package:hamro_patro/View/HomePage/JyotishPage/jyotishdetailpage.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class JyotishPage extends ConsumerStatefulWidget {
  const JyotishPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JyotishPageState();
}

class _JyotishPageState extends ConsumerState<JyotishPage> {
  List<JyotishModel>? details;
  getinitdata() async {
    final dw = await ref.read(jyotishProvider).getJyotish();
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
        appBar: AppBar(
          title: const Text('ज्योतिष'),
          backgroundColor: mainColor,
        ),
        body: details == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: details!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.w)),
                    padding: EdgeInsets.only(
                      left: 2.w,
                      right: 2.w,
                      top: 2.w,
                    ),
                    margin: EdgeInsets.all(2.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            details![index].photo.toString().startsWith('/')
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    backgroundImage: MemoryImage(
                                        base64Decode(details![index].photo!)),
                                    radius: 5.w,
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    radius: 5.w,
                                    backgroundImage: AssetImage(
                                        "assets/images/dharmadarshan.png"),
                                  ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Expanded(
                              child: Text(
                                details![index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          details![index].shortDescription.trim(),
                          style: TextStyle(
                              fontSize: 11.sp, letterSpacing: 0.2, height: 1.3),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                FlutterPhoneDirectCaller.callNumber(
                                    details![index].contact.toString());
                              },
                              child: Chip(
                                  backgroundColor: Colors.green,
                                  label: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.video_call,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        Text(
                                          "कल",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JyotishDetailPage(
                                          id: details![index].id),
                                    ));
                              },
                              child: Chip(
                                  backgroundColor: Colors.white,
                                  label: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "विवरण",
                                      style: TextStyle(
                                          color: secondColor, fontSize: 12.sp),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  );
                }));
  }
}
