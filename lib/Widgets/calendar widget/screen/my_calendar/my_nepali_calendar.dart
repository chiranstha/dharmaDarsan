// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as p;
import 'package:intl/intl.dart';
import '../../../../Riverpod/Models/EventModel.dart';
import '../../../../Riverpod/Models/calendarmodel.dart';
import '../../../../Riverpod/Repository/EventController.dart';
import '../../../../Riverpod/Repository/calendarcontroller.dart';
import '../../utils/get_days_ago.dart';
import '../../widgets/custom_divider.dart';
import '../../pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../widgets/widget_space.dart';
import 'calendar_controller.dart';
import 'components/selected_day_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:sizer/sizer.dart';

class MyNepaliCalendar extends ConsumerStatefulWidget {
  const MyNepaliCalendar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyNepaliCalendarState();
}

class _MyNepaliCalendarState extends ConsumerState<MyNepaliCalendar>
    with TickerProviderStateMixin {
  List dates = [];
  CalendarModel? cm;

  List<EventModel>? eventdata;
  List<EventModel>? eventred;
  getdata(String date) async {
    final dw = await ref.read(calendarProvider).getdates(date);

    if (mounted) {
      setState(() {
        cm = dw;
      });
    }
  }

  getnearbydata() async {
    final em = await ref.read(eventProvider).getEvents();
    if (mounted) {
      setState(() {
        eventdata = em;
      });
    }
  }

  // geteventdata(String year, String month) async {
  //   final data = await ref.read(eventProvider).getEventsByMonth(year, month);
  //   ref.read(dateStateProvider.notifier).setdate(data);
  // }

  CalendarController state = CalendarController();

  final NepaliCalendarController _nepaliCalendarController =
      NepaliCalendarController();

  final ValueNotifier<NepaliDateTime> _selectedDate =
      ValueNotifier(NepaliDateTime.now());

  String _daysAgo = "";

  TextEditingController yearCtrl = TextEditingController();
  TextEditingController monthCtrl = TextEditingController();
  dynamic monthselected;
  dynamic yearselected;

  @override
  void initState() {
    super.initState();
    getdata(getnepalidate(NepaliDateTime.now().toString()));
    getnearbydata();
    // geteventdata(NepaliDateTime.now().year.toString(),
    //     NepaliDateTime.now().month.toString());

    state = p.Provider.of<CalendarController>(context, listen: false);
    state.init();
  }

  @override
  Widget build(BuildContext context) {
    state = context.watch<CalendarController>();

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LimitedBox(
            maxHeight: size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CleanNepaliCalendar(
                      headerDayBuilder: (String weekDay, int index) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              weekDay,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 5.3.w),
                            ),
                          ),
                        );
                      },
                      headerDayType: HeaderDayType.halfName,
                      controller: _nepaliCalendarController,
                      onHeaderTapped: (date) {
                        // showAboutDialog(context: context, applicationName: "Hello");
                        showModalBottomSheet(
                            // backgroundColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            context: context,
                            builder: (context) => Wrap(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        verticalSpace(height: 10),
                                        const Text(
                                          "मिति रोज्नुहोस",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        verticalSpace(height: 30),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "वर्ष",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  verticalSpace(height: 10),
                                                  DropdownButtonFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        fillColor: Colors.grey,
                                                        hintText:
                                                            "वर्ष छान्नुहोस",
                                                        hintStyle:
                                                            const TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                      items: yearList
                                                          .map((item) =>
                                                              DropdownMenuItem(
                                                                value: item,
                                                                child: Text(
                                                                    NepaliUnicode
                                                                        .convert(
                                                                            item.toString())),
                                                              ))
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          yearselected =
                                                              value.toString();
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            horizontalSpace(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "महिना",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  verticalSpace(height: 10),
                                                  DropdownButtonFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        fillColor: Colors.grey,
                                                        hintText:
                                                            "महिना छान्नुहोस",
                                                        hintStyle:
                                                            const TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                      items: months
                                                          .map((item) =>
                                                              DropdownMenuItem(
                                                                value: item,
                                                                child: Text(item
                                                                    .toString()),
                                                              ))
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          monthselected =
                                                              value.toString();
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        verticalSpace(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.2),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 50,
                                                      vertical: 18)),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "रद्द गर्नुहोस",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.red.shade400,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 50,
                                                      vertical: 18)),
                                              onPressed: () {
                                                if (monthselected != null &&
                                                    yearselected != null) {
                                                  // final monthnumber = months.indexOf(monthselected)+1;
                                                  _nepaliCalendarController
                                                      .setSelectedDay(
                                                          NepaliDateTime(
                                                              int.parse(
                                                                  yearselected),
                                                              months.indexOf(
                                                                      monthselected) +
                                                                  1,
                                                              1));
                                                  setState(() {
                                                    monthselected = null;
                                                    yearselected = null;
                                                  });
                                                  Navigator.pop(context);
                                                } else if (yearselected ==
                                                    null) {
                                                  showtoast("वर्ष छान्नुहोस");
                                                } else {
                                                  showtoast("महिना छान्नुहोस");
                                                }
                                              },
                                              child: const Text("खोज्नुहोस"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]));
                      },
                      calendarStyle: CalendarStyle(
                        selectedColor: Colors.grey.shade500,
                        dayStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        todayStyle: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                        highlightSelected: true,
                        renderDaysOfWeek: true,
                        highlightToday: true,
                      ),
                      headerStyle: const HeaderStyle(
                        enableFadeTransition: false,
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        leftChevronIcon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                        rightChevronIcon: Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.white, size: 22),
                      ),
                      initialDate: NepaliDateTime.now(),
                      language: Language.nepali,
                      onDaySelected: (day) {
                        // getdata(NepaliDateFormat.yMd().format(day));
                        // print(day);
                        getdata(getnepalidate(day.toString()));

                        _selectedDate.value = day;
                      },
                      // display the english date along with nepali date.

                      dateCellBuilder: cellBuilder),
                  const CustomDivider(),
                  StickyHeader(
                    header: ValueListenableBuilder(
                      valueListenable: _selectedDate,
                      builder: (context, date, _) {
                        _daysAgo = MyDateUtils.nepaliDaysCount(
                                fromDate: state.currentDate, toDate: "$date")
                            .toString();

                        return Column(
                          children: [
                            Container(
                              color: Colors.grey[100],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectedEventWidget(
                                    monthYear:
                                        NepaliDateFormat.yMMMM(Language.nepali)
                                            .format(_selectedDate.value)
                                            .toString(),
                                    dayOfMonth:
                                        NepaliDateFormat.d(Language.nepali)
                                            .format(_selectedDate.value)
                                            .toString(),
                                    weekDay:
                                        NepaliDateFormat.EEEE(Language.nepali)
                                            .format(_selectedDate.value)
                                            .toString(),
                                    englishDate: DateFormat.yMMMMd().format(
                                        (_selectedDate.value).toDateTime()),
                                    daysAgo: MyDateUtils.daysAgo(
                                        daysCount: _daysAgo),
                                    details: cm ??
                                        CalendarModel(
                                            date: "-",
                                            tithi: "",
                                            dayDetails: []),
                                  ),
                                  const CustomDivider()
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "कार्यक्रमहरु",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2),
                          ),
                        ),
                        verticalSpace(height: 8.0),
                        eventdata == null
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.separated(
                                shrinkWrap: true,
                                itemCount: eventdata!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return const CustomDivider();
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 15.0,
                                        top: 12.0,
                                        bottom: 12.0),
                                    child: Row(
                                      children: [
                                        horizontalSpace(width: 8),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color:
                                                Colors.black.withOpacity(0.1),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "${NepaliDateFormat.MMMM(Language.nepali).format(selectdate(eventdata![index].dateMiti))} ${NepaliDateFormat.d(Language.nepali).format(selectdate(eventdata![index].dateMiti))}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                NepaliDateFormat.EEEE(
                                                        Language.nepali)
                                                    .format(selectdate(
                                                        eventdata![index]
                                                            .dateMiti)),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 9.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        horizontalSpace(width: 22),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            eventdata![index].name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${NepaliUnicode.convert(eventdata![index].remainingDays.toString())}  दिन बाँकी",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget cellBuilder(isToday, isSelected, isDisabled, NepaliDateTime nepaliDate,
      label, text, calendarStyle, isWeekend) {
    Decoration buildCellDecoration() {
      if (isSelected && isToday) {
        return BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.shade400,
            border: Border.all(color: calendarStyle.selectedColor, width: 2.0));
      }
      if (isSelected) {
        return BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: calendarStyle.selectedColor, width: 2.0));
      } else if (isToday && calendarStyle.highlightToday) {
        return BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue.shade400,
        );
      } else {
        return BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.transparent),
        );
      }
    }

    // if (nepaliDate.day == 1) print(ref.watch(dateStateProvider).getdate());

    return AnimatedContainer(
      margin: const EdgeInsets.all(0.8),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      duration: const Duration(milliseconds: 2000),
      decoration: buildCellDecoration(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 22,
                color: isWeekend ? Colors.red : Colors.black,
              ),
            ),
            // to show events
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // eventred == null
                //     ? Container()
                //     : CircleAvatar(
                //         radius: 2.2,
                //         backgroundColor:
                //             nepaliDate.weekday == 7 ? Colors.red : Colors.blue,
                //       ),

                // if (ref.watch(dateStateProvider).getdate() != null)
                // for (var i = 0;
                //     i < ref.watch(dateStateProvider).getdate()!.length;
                //     i++)
                //   if (ref.watch(dateStateProvider).getdate()![i].dateMiti ==
                //       NepaliDateFormat.yMd().format(nepaliDate))

                if (ref.watch(dateStateProvider).getdate() != null)
                  if (ref.watch(dateStateProvider).getdate()!.any((event) =>
                      event.dateMiti ==
                      NepaliDateFormat.yMd().format(nepaliDate)))
                    CircleAvatar(
                      radius: 2.8,
                      backgroundColor: Colors.red,
                    ),
                horizontalSpace(width: 4.0),
                Text(
                  nepaliDate.toDateTime().day.toString(),
                  style: TextStyle(
                      fontSize: 10,
                      color: isWeekend ? Colors.red : Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getnepalidate(String date) {
    final dates = date.split(" ");
    final dw = dates[0].split("-");
    return "${dw[0]}/${dw[1]}/${dw[2]}";
  }

  selectdate(String date) {
    final dw = date.split("/");
    final cc = "${dw[0]}-${dw[1]}-${dw[2]}";
    final dd = NepaliDateTime.parse(cc);
    return dd;
  }
}

class DateState extends ChangeNotifier {
  dynamic todaydate;

  setdate(List<EventModel> idx) {
    todaydate = idx;
    notifyListeners();
  }

  List<EventModel>? getdate() {
    return todaydate;
  }
}

final dateStateProvider =
    ChangeNotifierProvider<DateState>((ref) => DateState());
