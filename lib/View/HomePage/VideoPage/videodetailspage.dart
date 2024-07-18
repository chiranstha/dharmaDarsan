// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Riverpod/Models/VideoModel.dart';
import '../../../Riverpod/Models/video_details_model.dart';

class VideoDetailsPage extends ConsumerStatefulWidget {
  VideoDetailsPage({required this.vediodetail, super.key});
  VedioDetail vediodetail;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoDetailsPageState();
}

class _VideoDetailsPageState extends ConsumerState<VideoDetailsPage> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.vediodetail.vedioLink)!,
      flags: const YoutubePlayerFlags(
          autoPlay: true, mute: false, loop: true, forceHD: true),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("पछाडि"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.vediodetail.name,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              YoutubePlayer(
                controller: controller,
                liveUIColor: Colors.amber,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.vediodetail.shortDescription,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.vediodetail.description,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
