import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Repository/BlogController.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../Riverpod/Models/BlogModel.dart';
import '../viewer.dart';

class BlogPage extends ConsumerStatefulWidget {
  const BlogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlogPageState();
}

class _BlogPageState extends ConsumerState<BlogPage> {
  List<BlogModel> bloglist = [];
  int page = 0;
  int limit = 10;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  final ScrollController _controller = ScrollController();
  void _firstLoad() async {
    setState(() {
      isFirstLoadRunning = true;
    });
    try {
      final studentHomeWork =
          await ref.read(blogProvider).getBlogs(page, limit);

      setState(() {
        bloglist = studentHomeWork;
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    print("loadmoreinvoked");
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {
      setState(() {
        isLoadMoreRunning = true;
      });
      page += 10;

      try {
        print("scrolled");
        final directory = await ref.read(blogProvider).getBlogs(page, limit);

        final List<BlogModel> fetchedData = directory;
        if (fetchedData.isNotEmpty) {
          setState(() {
            bloglist.addAll(fetchedData);
          });
          print(hasNextPage);
        } else {
          setState(() {
            hasNextPage = false;
            _controller.removeListener(_loadMore);
          });
        }
      } catch (err) {
        debugPrint('Something went wrong!');
      }

      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller.addListener(_loadMore);
    // _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ब्लगहरु"),
          backgroundColor: mainColor,
        ),
        body: isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : bloglist.isEmpty
                ? const Center(
                    child: Text("No data found"),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              // physics: const AlwaysScrollableScrollPhysics(),
                              controller: _controller,
                              shrinkWrap: true,
                              itemCount: bloglist.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.w, vertical: .5.w),
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 3.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bloglist[index].name,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: .5.w,
                                            ),
                                            Text(
                                              bloglist[index].shortDescription,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.w,
                                            ),
                                            createRow(
                                                "assets/images/oldcalendar.svg",
                                                NepaliUnicode.convert(
                                                    bloglist[index]
                                                        .dateMiti
                                                        .toString()),
                                                6,
                                                13,
                                                false),
                                            SizedBox(
                                              height: 1.5.w,
                                            ),
                                            // createRow("assets/images/oldcalendar.svg",
                                            //     details![index].name, 6, 13),
                                            createRow(
                                                "assets/images/bookmark.svg",
                                                bloglist[index]
                                                    .blogCategoryName,
                                                6,
                                                12,
                                                false),
                                            SizedBox(
                                              height: 1.5.w,
                                            ),

                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewPage(
                                                        id: bloglist[index].id,
                                                        date: bloglist[index]
                                                            .dateMiti
                                                            .toString(),
                                                      ),
                                                    ));
                                              },
                                              child: Chip(
                                                backgroundColor: secondColor,
                                                label: Text(
                                                  "पूरा पढ्नुहोस्",
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                        if (isLoadMoreRunning == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 5.w,
                        ),
                      ],
                    ),
                  ));
  }
}

Widget createRow(
    String image, String text, int imageheight, int fontsize, bool title) {
  return Row(
    children: [
      SvgPicture.asset(
        image,
        height: imageheight.w,
      ),
      SizedBox(
        width: 2.w,
      ),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontsize.sp,
              fontWeight: title ? FontWeight.w500 : null),
        ),
      ),
    ],
  );
}
