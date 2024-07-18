import 'package:flutter/material.dart';
import 'package:hamro_patro/Riverpod/Models/VideoModel.dart';
import 'package:hamro_patro/Riverpod/Models/categorymodel.dart';
import 'package:hamro_patro/Riverpod/Repository/YoutubeVideoController.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Widgets/calendar widget/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../../Widgets/calendar widget/widgets/widget_space.dart';
import '../../../Widgets/constants.dart';

class YoutubeVideoPage extends ConsumerStatefulWidget {
  const YoutubeVideoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YoutubeVideoPageState();
}

class _YoutubeVideoPageState extends ConsumerState<YoutubeVideoPage> {
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(youtubevideos);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("भिडियो"),
          backgroundColor: mainColor,
        ),
        body: details.when(
            data: (data) => ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await launch(
                            "https://www.youtube.com/watch?v=${data[index].id.videoId}",
                          );
                        } catch (e) {
                          // An exception is thrown if browser app is not installed on Android device.
                          debugPrint(e.toString());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 16.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(data[index]
                                        .snippet
                                        .thumbnails!
                                        .medium
                                        .url),
                                    fit: BoxFit.cover),
                                color: Colors.grey.shade300,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              width: MediaQuery.of(context).size.width * 0.35,
                            ),
                            // horizontalSpace(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].snippet.title!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    verticalSpace(height: 2),
                                    Text(
                                      data[index].snippet.description!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    verticalSpace(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.video_camera_back_outlined,
                                          color: Colors.black,
                                        ),
                                        horizontalSpace(width: 10),
                                        Text(
                                          NepaliUnicode.convert(data[index]
                                                  .snippet
                                                  .publishedAt!)
                                              .substring(0, 10),
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
            error: (Object error, StackTrace stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
