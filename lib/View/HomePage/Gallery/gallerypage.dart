// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";

class EventGallery extends ConsumerStatefulWidget {
  const EventGallery({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventGalleryState();
}

class _EventGalleryState extends ConsumerState<EventGallery> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // final gallerylist = ref.watch(galleryListDataProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text("ग्यालेरी"),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            child:
                //  gallerylist.when(
                //   data: (data) {
                //     return
                Container(
              height: height,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "Photo Gallery",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(
                          // height: height * 0.5,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 120,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (BuildContext context, int dindex) {
                              return Image.asset(
                                "assets/images/guru.png",
                                width: 250,
                                height: 250,
                                fit: BoxFit.contain,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
    // },
    //   error: (err, s) => Text(err.toString()),
    //   loading: () => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // )));
    // }
  }
}

// class DetailScreen extends ConsumerStatefulWidget {
//   DetailScreen({this.image, this.index, super.key})
//       : pageController = PageController(initialPage: index);
//   final PageController pageController;
//   List<GalleryDetail>? image;
//   final index;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends ConsumerState<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           elevation: 0,
//         ),
//         body: PhotoViewGallery.builder(
//             pageController: widget.pageController,
//             itemCount: widget.image!.length,
//             builder: (context, index) {
//               return PhotoViewGalleryPageOptions(
//                 imageProvider: MemoryImage(
//                   base64Decode(widget.image![index].imageByte.toString()),
//                 ),
//                 minScale: PhotoViewComputedScale.contained,
//                 maxScale: PhotoViewComputedScale.contained,
//               );
//             }));
//   }
// }
