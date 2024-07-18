import 'dart:convert';

import 'package:hamro_patro/Riverpod/Models/youtubefetchmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dio.dart';

class YoutubeVideoController {
  Future<List<YModel>> getallvideos() async {
    const url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UC3Kbs83OeFuy1c5aP5cf6Yw&maxResults=500&order=date&type=video&key=AIzaSyBuIJoogIRGSQVlTq3BmhqzCN4DjG8vpoA";
    try {
      final response = await Api().get(
        url,
      );

      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["items"];

      return data.map((data) => YModel.fromJson(data)).toList();
    } catch (e) {
      List<YModel> a = [];
      return a;
    }
  }
}

final youtubevideoProvider =
    Provider<YoutubeVideoController>((ref) => YoutubeVideoController());

final youtubevideos = FutureProvider<List<YModel>>((ref) async {
  final youtubevideo = ref.watch(youtubevideoProvider);
  final data = await youtubevideo.getallvideos();
  return data;
});
