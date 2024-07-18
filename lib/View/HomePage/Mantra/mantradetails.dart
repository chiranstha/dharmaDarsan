import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../../../Riverpod/Models/MantraModel.dart';
import '../../../Widgets/constants.dart';
import '../BlogPage/blogpage.dart';

class MantraDetailsPage extends ConsumerStatefulWidget {
  const MantraDetailsPage({super.key, required this.data});
  final MantraModel data;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MantraDetailsPageState();
}

class _MantraDetailsPageState extends ConsumerState<MantraDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("मन्त्र"),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createRow(
                  "assets/images/mantra.svg", widget.data.name, 8, 18, true),
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
                    widget.data.mantraTypeString,
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                widget.data.description.toString(),
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
