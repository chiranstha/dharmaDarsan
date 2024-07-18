import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/View/HomePage/ProgramPage/eventdetailspage.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../Riverpod/Models/ProgramModel.dart';
import '../../../Riverpod/Repository/ProgramController.dart';

class EventPage extends ConsumerStatefulWidget {
  const EventPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventPageState();
}

class _EventPageState extends ConsumerState<EventPage> {
  List<ProgramModel>? details;

  getinitdata() async {
    final dw = await ref.read(programProvider).getPrograms();
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
          title: const Text("कार्यक्र्महरु"),
          backgroundColor: mainColor,
        ),
        body: details == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                child: ListView.builder(
                    itemCount: details!.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: .5.w),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetailsPage(
                                        id: details![index].id),
                                  ));
                            },
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      details![index].name,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.w,
                                    ),
                                    Text(
                                      details![index].shortDescription.trim(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.w,
                                    ),
                                    createRow("assets/images/oldcalendar.svg",
                                        details![index].dateMiti, 6, 13, false),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    // createRow("assets/images/oldcalendar.svg",
                                    //     details![index].name, 6, 13),
                                    createRow("assets/images/location.svg",
                                        details![index].location, 6, 13, false),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ));
  }
}

createRow(
    String image, String text, int imageheight, int fontsize, bool title) {
  return Row(
    children: [
      SvgPicture.asset(
        image,
        height: imageheight.w,
      ),
      SizedBox(
        width: 2.w,
      ),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontsize.sp,
              fontWeight: title ? FontWeight.w500 : null),
        ),
      ),
    ],
  );
}
