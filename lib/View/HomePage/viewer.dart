import 'package:flutter/material.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Repository/BlogController.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../Riverpod/Models/BlogModel.dart';
import '../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import 'BlogPage/blogpage.dart';

class ViewPage extends ConsumerStatefulWidget {
  ViewPage({required this.id, required this.date, super.key});
  String id;
  String date;

  @override
  ConsumerState<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends ConsumerState<ViewPage> {
  BlogModel? details;
  getinitdata() async {
    final dw = await ref.read(blogProvider).getbookdetails(widget.id);
    if (mounted) {
      setState(() {
        details = dw;
      });
    }
  }

  double fontSize = 20.0;
  bool isPressed = false;
  bool isSearched = false;
  double? currentBrightness;
  double scrollpoint = 260000;
  final ScrollController sc = ScrollController();
  brightnessSet() async {
    final brightness = await FlutterScreenWake.brightness;
    setState(
      () {
        currentBrightness = brightness;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getinitdata();
    brightnessSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ब्लग'),
          backgroundColor: const Color(0xFFdb1304),
          elevation: 0,
        ),
        body: details == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                controller: sc,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/oldcalendar.svg",
                            height: (fontSize - 12).w,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              NepaliUnicode.convert(widget.date.toString()),
                              style: TextStyle(
                                  fontSize: fontSize - 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: mainColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                details!.blogCategoryName,
                                style: TextStyle(
                                    fontSize: fontSize - 2,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      Text(
                        details!.name,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      Text(
                        details!.shortDescription,
                        style: TextStyle(
                          fontSize: fontSize - 2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      Text(
                        details!.description,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: fontSize - 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Visibility(
                visible: isPressed,
                child: FloatingActionButton(
                  backgroundColor: secondColor,
                  onPressed: () async {
                    setState(() {
                      isPressed = false;
                    });
                    showDialog<void>(
                        context: context,
                        builder: (_) {
                          return FittedBox(
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              insetPadding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 350),
                              content: StatefulBuilder(
                                builder: (context, state) => FittedBox(
                                  child: Column(
                                    children: [
                                      const Text(
                                        "स्क्रोल गति",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Text("छिटो"),
                                          Slider(
                                            min: 120000,
                                            max: 260000,
                                            value: scrollpoint,
                                            divisions: 6,
                                            onChanged: (double b) {
                                              state(
                                                () {
                                                  setState(
                                                    () {
                                                      scrollpoint = b;
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          const Text("ढिलो"),
                                        ],
                                      ),
                                      verticalSpace(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          sc.animateTo(
                                            sc.offset +
                                                sc.position.maxScrollExtent,
                                            duration: Duration(
                                                milliseconds:
                                                    scrollpoint.toInt()),
                                            curve: Curves.linear,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "ठिक छ",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: const Icon(
                    Icons.arrow_downward,
                  ),
                ),
              ),
              verticalSpace(height: 10),
              Visibility(
                visible: isPressed,
                child: FloatingActionButton(
                  backgroundColor: secondColor,
                  onPressed: () {
                    isPressed = false;
                    showDialog<void>(
                      context: context,
                      builder: (_) {
                        return FittedBox(
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            insetPadding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 350),
                            content: StatefulBuilder(
                              builder: (context, state) => FittedBox(
                                child: Column(
                                  children: [
                                    const Text(
                                      "प्रकाश",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Slider(
                                      value: currentBrightness!,
                                      divisions: 6,
                                      onChanged: (double b) {
                                        state(
                                          () {
                                            setState(
                                              () {
                                                currentBrightness = b;
                                              },
                                            );
                                            FlutterScreenWake.setBrightness(b);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.brightness_medium,
                  ),
                ),
              ),
              verticalSpace(height: 10),
              Visibility(
                visible: isPressed,
                child: FloatingActionButton(
                  backgroundColor: secondColor,
                  onPressed: () {
                    isPressed = false;
                    showDialog(
                      context: context,
                      builder: (_) {
                        return FittedBox(
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            insetPadding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 300),
                            content: StatefulBuilder(
                              builder: (context, state) => FittedBox(
                                child: Column(
                                  children: [
                                    const Text(
                                      "साइज परिवर्तन गर्नुहोस्",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Slider(
                                      value: fontSize,
                                      min: 15,
                                      max: 40,
                                      divisions: 10,
                                      onChanged: (value) {
                                        state(
                                          () {
                                            setState(
                                              () {
                                                fontSize = value;
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "ठिक छ",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      // style: const ButtonStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: const Icon(Icons.text_fields_sharp),
                ),
              ),
              verticalSpace(height: 10),
              FloatingActionButton(
                // backgroundColor: secondColor,
                onPressed: () {
                  isPressed = !isPressed;
                  setState(() {});
                },
                child: Icon(isPressed ? Icons.close : Icons.settings),
              ),
            ],
          ),
        ));
  }
}
