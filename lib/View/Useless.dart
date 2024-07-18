 // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.h),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFdb1304),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 2.w, vertical: 0.5.h),
                //       child: Column(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.only(
                //                 left: 1.w, right: 1.w, top: 1.w),
                //             child: InkWell(
                //               onTap: () {
                //                 Navigator.pushReplacement(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => Home(
                //                               idx: 1,
                //                             )));
                //               },
                //               child: Row(
                //                 children: [
                //                   Text(
                //                     NepaliDateFormat.yMMMM(Language.nepali)
                //                         .format(NepaliDateTime.now())
                //                         .toString(),
                //                     style: TextStyle(
                //                         fontSize: 14.sp,
                //                         letterSpacing: 0.3,
                //                         color: Colors.white,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                   const Spacer(),
                //                   const Icon(
                //                     Icons.arrow_forward_ios,
                //                     color: Colors.white,
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //           verticalSpace(height: 0),
                //           SingleChildScrollView(
                //             scrollDirection: Axis.horizontal,
                //             physics: const BouncingScrollPhysics(),
                //             child: Row(children: [
                //               for (var i in datelist)
                //                 Padding(
                //                   key: myKeys[datelist.indexOf(i)],
                //                   padding: EdgeInsets.only(
                //                       left: 0.5.w,
                //                       right: 3.w,
                //                       top: 2.w,
                //                       bottom: 2.w),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       Column(
                //                         children: [
                //                           CircleAvatar(
                //                             backgroundColor: Colors.white,
                //                             radius: 17,
                //                             child: CircleAvatar(
                //                               backgroundColor: i.date == date
                //                                   ? Colors.green
                //                                   : saturdays.contains(i.date!)
                //                                       ? Colors.red
                //                                       : Colors.blue.shade100,
                //                               radius: 16,
                //                               child: Text(
                //                                 NepaliUnicode.convert(
                //                                     i.date.toString()),
                //                                 style: TextStyle(
                //                                     fontSize: 13.sp,
                //                                     color: i.date == date
                //                                         ? Colors.white
                //                                         : saturdays.contains(
                //                                                 i.date!)
                //                                             ? Colors.white
                //                                             : Colors.black,
                //                                     fontWeight:
                //                                         FontWeight.w500),
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       verticalSpace(height: 5),
                //                       Text(
                //                         i.day.toString(),
                //                         style: TextStyle(
                //                           color: Colors.white,
                //                           fontSize: 11.sp,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 )
                //             ]),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),


            // Upward code
             // final year = NepaliDateTime.now().year;
  // final month = NepaliDateTime.now().month.toString().length == 1
  //     ? "0${NepaliDateTime.now().month}"
  //     : NepaliDateTime.now().month;

  // final totaldays = NepaliDateTime.now().totalDays;
  // List<int> saturdays = [];
  // List<DateModel> datelist = [];
  // final ScrollController scrollController =
  //     ScrollController(initialScrollOffset: 0.0);

  // List<GlobalKey> myKeys = [];

  // getDays() {
  //   for (int i = 1; i <= totaldays; i++) {
  //     myKeys.add(GlobalKey());
  //   }
  //   final day = NepaliDateTime.parse("$year-$month-01").weekday;

  //   // print(day);

  //   for (int i = 1; i <= 6; i++) {
  //     saturdays.add(7 * i - day + 1);
  //   }

  //   // final firstday = NepaliDateTime.parse("$year-$month-01").weekday;
  //   for (var i = 1; i <= totaldays; i++) {
  //     var index = i.toString().length == 1 ? "0$i" : "$i";
  //     final day = NepaliDateTime.parse("$year-$month-$index").weekday;
  //     datelist.add(DateModel(
  //         date: int.parse(index),
  //         day: day == 1
  //             ? "आइत"
  //             : day == 2
  //                 ? "सोम"
  //                 : day == 3
  //                     ? "मंगल"
  //                     : day == 4
  //                         ? "बुध"
  //                         : day == 5
  //                             ? "बिही"
  //                             : day == 6
  //                                 ? "शुक्र"
  //                                 : "शनि"));
  //   }
  // }

  // void scrollToItem(int index) {
  //   GlobalKey key = myKeys[index - 1];
  //   // print(key.currentContext);

  //   Scrollable.ensureVisible(
  //     key.currentContext!,
  //     // duration: const Duration(milliseconds: 500),
  //     // curve: Curves.easeInBack,
  //     alignment: .5,
  //   );

   // // getDays();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   scrollToItem(NepaliDateTime.now().day);
    // });

    // scrollController.dispose();
