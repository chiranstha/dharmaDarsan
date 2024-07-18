import 'package:flutter/material.dart';
import 'package:hamro_patro/Riverpod/Models/SaitModel.dart';
import 'package:hamro_patro/Riverpod/Repository/SaitController.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:sizer/sizer.dart';
import '../../Riverpod/Models/sait_bymonth.dart';
import '../../Widgets/calendar widget/widgets/container_decoration.dart';
import '../../Widgets/calendar widget/widgets/widget_space.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SaitScreen extends ConsumerStatefulWidget {
  const SaitScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SaitScreenState();
}

class _SaitScreenState extends ConsumerState<SaitScreen> {
  List<SaitModel>? details;

  getinitdata() async {
    final dw = await ref.read(saitProvider).getSaits();
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
        title: const Text('साइत'),
        backgroundColor: const Color(0xFFdb1304),
      ),
      body: details == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: details!.length,
                  itemBuilder: (context, index) => StickyHeader(
                    header: details![index].sites.isEmpty
                        ? SizedBox()
                        : eventHeader(title: details![index].category),
                    content: details![index].sites.isEmpty
                        ? SizedBox()
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: details![index].sites.length,
                            itemBuilder: (context, dindex) => randomNumberList(
                                name: details![index].sites[dindex].month == 1
                                    ? "बैशाख"
                                    : details![index].sites[dindex].month == 2
                                        ? "जेठ"
                                        : details![index].sites[dindex].month ==
                                                3
                                            ? "असार"
                                            : details![index]
                                                        .sites[dindex]
                                                        .month ==
                                                    4
                                                ? "साउन"
                                                : details![index]
                                                            .sites[dindex]
                                                            .month ==
                                                        5
                                                    ? "भदौ"
                                                    : details![index]
                                                                .sites[dindex]
                                                                .month ==
                                                            6
                                                        ? "असोज"
                                                        : details![index]
                                                                    .sites[
                                                                        dindex]
                                                                    .month ==
                                                                7
                                                            ? "कार्तिक"
                                                            : details![index]
                                                                        .sites[
                                                                            dindex]
                                                                        .month ==
                                                                    8
                                                                ? "मंसिर"
                                                                : details![index]
                                                                            .sites[
                                                                                dindex]
                                                                            .month ==
                                                                        9
                                                                    ? "पुष"
                                                                    : details![index].sites[dindex].month ==
                                                                            10
                                                                        ? "माघ"
                                                                        : details![index].sites[dindex].month ==
                                                                                11
                                                                            ? "फाल्गुन"
                                                                            : "चैत्र",
                                modeldata:
                                    details![index].sites[dindex].byMonths),
                          ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget eventHeader({required String title}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget randomNumberList(
      {required String name, required List<ByMonth> modeldata}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpace(width: 10),
          Expanded(
            child: Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ),
          horizontalSpace(width: 20),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 8.w,
              // width: 50,
              child: ListView.builder(
                itemCount: modeldata.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    // height: 12.w,
                    width: 10.w,
                    margin: const EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    decoration: CustomDecoration.customBoxDecoration(
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(color: Colors.grey.shade800)),
                    child: Text(
                      NepaliUnicode.convert(
                          modeldata[index].dateOnly.toString()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rowIconWidget(
      {required String text,
      required IconData iconData,
      Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.amber,
            size: 50,
          ),
          verticalSpace(),
          Text(
            text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.black, fontSize: 12.0, letterSpacing: 0.2),
          )
        ],
      ),
    );
  }
}
