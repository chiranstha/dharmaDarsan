// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';

import 'package:hamro_patro/Riverpod/Models/RadioModel.dart';
import 'package:hamro_patro/Widgets/constants.dart';

import '../Widgets/radiolist.dart';

class RadioPage extends ConsumerStatefulWidget {
  const RadioPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RadioPageState();
}

class _RadioPageState extends ConsumerState<RadioPage> {
  bool isplaying = false;
  bool isdisplaying = false;
  final TextEditingController searchController = TextEditingController();
  List<RadioModel> radioList =
      radiolist.map((data) => RadioModel.fromJson(data)).toList();
  List<RadioModel> searchedRadioList =
      radiolist.map((data) => RadioModel.fromJson(data)).toList();
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    // audioPlayer.onPlayerStateChanged.listen((event) {
    //   audioPlayer.stop();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('रेडियो'),
        backgroundColor: const Color(0xFFdb1304),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.5.h,
            ),
            //search
            Padding(
              padding: EdgeInsets.all(2.w),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search Station',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchedRadioList = radioList
                        .where((element) => element.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchedRadioList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    setState(() {
                      isdisplaying = true;
                      isplaying = true;
                    });
                    try {
                      await audioPlayer
                          .setUrl(searchedRadioList[index].streamUrl);
                      await audioPlayer.play();
                    } catch (e) {
                      showtoast(e.toString());
                    }
                  },
                  leading: Container(
                    height: 10.w,
                    width: 12.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                          searchedRadioList[index].logo,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(searchedRadioList[index].title),
                  subtitle: Text("${searchedRadioList[index].frequency} MHz"),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isdisplaying,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () async {
                  await audioPlayer.seekToPrevious();
                },
              ),
              isplaying
                  ? IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () async {
                        setState(() {
                          isplaying = false;
                        });
                        await audioPlayer.pause();
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () async {
                        setState(() {
                          isplaying = true;
                        });
                        await audioPlayer.play();
                      },
                    ),
              // IconButton(
              //   icon: const Icon(Icons.pause),
              //   onPressed: () async {
              //     await audioPlayer.pause();
              //   },
              // ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () async {
                  await audioPlayer.seekToNext();
                },
              ),
            ],
          ),
        ),
      ),
      //  Row(
      //   children: [
      //     Text("Now Playing:"),
      //   ],
      // ),
    );
  }
}
