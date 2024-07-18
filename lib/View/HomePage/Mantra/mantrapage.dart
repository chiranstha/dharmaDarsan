import 'package:flutter/material.dart';
import 'package:hamro_patro/View/HomePage/Mantra/mantradetails.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../Riverpod/Repository/MantraRepository.dart';
import '../BlogPage/blogpage.dart';

class MantraPage extends ConsumerStatefulWidget {
  const MantraPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MantraPageState();
}

class _MantraPageState extends ConsumerState<MantraPage> {
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(mantradataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("मन्त्र"),
          backgroundColor: mainColor,
        ),
        body: details.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: .5.w),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MantraDetailsPage(data: data[index]),
                              ));
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                createRow("assets/images/mantra.svg",
                                    data[index].name, 7, 13, true),
                                SizedBox(
                                  height: 1.5.w,
                                ),
                                createRow("assets/images/bookmark.svg",
                                    data[index].mantraTypeString, 4, 12, false),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
