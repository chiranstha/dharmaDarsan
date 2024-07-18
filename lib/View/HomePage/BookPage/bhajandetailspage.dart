// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:hamro_patro/View/HomePage/ProgramPage/eventpage.dart";
import "package:hamro_patro/Widgets/constants.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:sizer/sizer.dart";

import "../../../Riverpod/Models/BookModel.dart";
import "../../../Riverpod/Repository/bookcontroller.dart";

class BhajanDetailsPage extends ConsumerStatefulWidget {
  BhajanDetailsPage({required this.id, required this.details, super.key});
  String id;
  BookModel details;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BhajanDetailsPageState();
}

class _BhajanDetailsPageState extends ConsumerState<BhajanDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("भजन"),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createRow(
                  "assets/images/book.svg", widget.details.name, 8, 18, true),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: mainColor)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.details.bookType,
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                widget.details.shortDescription.toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
