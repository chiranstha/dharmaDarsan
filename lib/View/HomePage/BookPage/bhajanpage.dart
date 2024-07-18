import 'package:flutter/material.dart';
import 'package:hamro_patro/Riverpod/Repository/bookcontroller.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/try.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../Widgets/constants.dart';
import '../ProgramPage/eventpage.dart';
import 'bhajandetailspage.dart';

class BhajanPage extends ConsumerStatefulWidget {
  const BhajanPage({super.key, required this.id, required this.name});
  final int id;
  final String name;
  @override
  ConsumerState<BhajanPage> createState() => _BhajanPageState();
}

class _BhajanPageState extends ConsumerState<BhajanPage> {
  // List<BookModel>? details;
  // getinitdata() async {
  //   final dw = await ref.read(bookServiceProvider).getbooks();
  //   if (mounted) {
  //     setState(() {
  //       details = dw;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getinitdata();
  }

  @override
  Widget build(BuildContext context) {
    // final connection = ref.watch(connectivityControllerProvider);
    final blog = ref.watch(bookProvider(widget.id));

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: mainColor,
        ),
        body: blog.when(
          data: (data) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: .5.w),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BhajanDetailsPage(
                                  id: data[index].id,
                                  details: data[index],
                                ),
                              ));
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                createRow("assets/images/book.svg",
                                    data[index].name, 6, 13, true),
                                SizedBox(
                                  height: 1.5.w,
                                ),
                                Text(
                                  data[index].shortDescription.trim(),
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
          error: (Object error, StackTrace stackTrace) {
            return const Center(child: Text('No Data Found'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
