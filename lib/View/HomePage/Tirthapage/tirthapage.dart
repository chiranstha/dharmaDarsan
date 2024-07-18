import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Repository/templecontroller.dart';
import 'package:hamro_patro/View/HomePage/Tirthapage/tirthadetails.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../Riverpod/Models/templemodel.dart';

class TirthaPage extends ConsumerStatefulWidget {
  const TirthaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TirthaPageState();
}

class _TirthaPageState extends ConsumerState<TirthaPage> {
  TempleModel? details;
  getinitdata() async {
    final dw = await ref.read(templeProvider).gettemples();
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
          title: const Text("तीर्थ स्थल"),
          backgroundColor: mainColor,
        ),
        body: details == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                child: ListView.builder(
                  itemCount: details!.items.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: .5.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TirthaDetails(
                                    id: details!.items[index].id)));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/templesvg.svg",
                                    height: 6.w,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          details!.items[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          details!.items[index].shortDescription
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/call.svg",
                                    height: 6.w,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      details!.items[index].phone.toString(),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/priest.svg",
                                    height: 6.w,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      details!.items[index].priest.toString(),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: .5.h,
                              // ),
                              // Row(
                              //   children: [
                              //     SvgPicture.asset(
                              //       "assets/images/location.svg",
                              //       height: 6.w,
                              //     ),
                              //     SizedBox(
                              //       width: 2.w,
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //         details!.items[index].address.toString(),
                              //         style: TextStyle(
                              //           fontSize: 13.sp,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],

                            // leading: SvgPicture.asset("assets/images/templesvg.svg"),
                            // title: Text(details!.items[index].name.toString()),
                            // subtitle:
                            //     Text(details!.items[index].description.toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
