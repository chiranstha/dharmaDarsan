// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Repository/templecontroller.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../Riverpod/Models/temple_details_model.dart';

class TirthaDetails extends ConsumerStatefulWidget {
  TirthaDetails({required this.id, super.key});
  String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TirthaDetailsState();
}

class _TirthaDetailsState extends ConsumerState<TirthaDetails> {
  Item? details;

  getinitdata() async {
    final dw = await ref.read(templeProvider).gettempledetails(widget.id);
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
          title: details == null ? const Text("") : Text(details!.name),
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
                      SizedBox(
                        height: 2.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/templesvg.svg",
                            height: 9.w,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              details!.address.toString(),
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/priest.svg",
                            height: 9.w,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              details!.priest.toString(),
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/call.svg",
                            height: 9.w,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              details!.phone.toString(),
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text(
                        details!.description.toString(),
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
