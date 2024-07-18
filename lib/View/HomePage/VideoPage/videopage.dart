import 'package:flutter/material.dart';
import 'package:hamro_patro/Riverpod/Models/VideoModel.dart';
import 'package:hamro_patro/Riverpod/Models/categorymodel.dart';
import 'package:hamro_patro/View/HomePage/VideoPage/videodetailspage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../../Riverpod/Models/video_details_model.dart';
import '../../../Riverpod/Repository/videoController.dart';
import '../../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../../Widgets/calendar widget/widgets/widget_space.dart';
import '../../../Widgets/constants.dart';

class VideoPage extends ConsumerStatefulWidget {
  const VideoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends ConsumerState<VideoPage> {
  int selectedindex = 0;
  String? selectedname;
  List<CategoryModel>? category;
  List<VideoModel>? video;
  // List<VedioDetail>? videodetail;
  getinitdata() async {
    final details = await ref.read(videoProvider).getallcategory();
    final videodetails = await ref.read(videoProvider).getallVideos();
    if (mounted) {
      setState(() {
        category = details;
        video = videodetails;
        if (details.isNotEmpty) {
          selectedname = details[0].name;
        }
      });
    }
  }

  @override
  void initState() {
    getinitdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("भिडियो"),
          backgroundColor: mainColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StickyHeader(
                header: category == null
                    ? SizedBox()
                    : category!.isEmpty
                        ? SizedBox()
                        : Container(
                            color: mainColor,
                            height: 14.w,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: category!.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 4, top: 8, bottom: 8),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedindex = index;
                                        selectedname = category![index].name;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedindex == index
                                            ? Colors.green[500]
                                            : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(category![index].name,
                                            style: TextStyle(
                                              color: selectedindex == index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                content: video == null && selectedname == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : video!.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text("No Video Available"),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: video!
                                .where(
                                    (element) => element.name == selectedname)
                                .length,
                            itemBuilder: (context, index) {
                              List<VedioDetail>? details = video!
                                  .where(
                                      (element) => element.name == selectedname)
                                  .first
                                  .vedioDetail;
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VideoDetailsPage(
                                                  vediodetail: details[index],
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 16.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: Image.asset(
                                              'assets/images/dharmadarshan.png'),
                                        ),
                                        // horizontalSpace(width: 10),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  details[index].name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                verticalSpace(height: 2),
                                                Text(
                                                  details[index]
                                                      .shortDescription,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                verticalSpace(height: 5),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .video_camera_back_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    horizontalSpace(width: 10),
                                                    Text(
                                                      NepaliUnicode.convert(
                                                          "2079-02-12"),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
              ),
            ],
          ),
        ));
  }
}
