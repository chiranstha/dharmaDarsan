// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:hamro_patro/Riverpod/Repository/ProgramController.dart";
import "package:hamro_patro/View/HomePage/ProgramPage/eventpage.dart";
import "package:hamro_patro/Widgets/constants.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:sizer/sizer.dart";

import "../../../Riverpod/Models/ProgramModel.dart";

class EventDetailsPage extends ConsumerStatefulWidget {
  EventDetailsPage({required this.id, super.key});
  String id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventDetailsPageState();
}

class _EventDetailsPageState extends ConsumerState<EventDetailsPage> {
  ProgramModel? details;

  getinitdata() async {
    final dw = await ref.read(programProvider).geteventdetails(widget.id);
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
        title: const Text("कार्यक्रम विवरण"),
        backgroundColor: mainColor,
      ),
      body: details == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      details!.name.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    createRow("assets/images/oldcalendar.svg",
                        details!.dateMiti, 9, 13, false),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    createRow("assets/images/location.svg", details!.location,
                        9, 13, false),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      details!.description.toString(),
                      style: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
