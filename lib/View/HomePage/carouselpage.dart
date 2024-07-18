// ignore_for_file: unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hamro_patro/Widgets/constants.dart';

class Crousal extends StatefulWidget {
  const Crousal({super.key});

  @override
  State<StatefulWidget> createState() => _CrousalState();
}

class _CrousalState extends State<Crousal> {
  int current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/slider/pic1.jpeg',
      'assets/slider/pic2.jpeg',
      'assets/slider/pic4.jpeg',
      'assets/slider/pic5.jpeg',
      'assets/slider/pic6.jpeg',
      'assets/slider/pic7.jpeg',
      'assets/slider/pic8.jpeg',
      'assets/slider/pic9.jpeg',
      'assets/slider/pic10.jpeg',
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              margin: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  // borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Image.asset(
                item,
                width: double.infinity,
                fit: BoxFit.contain,
              )),
            ))
        .toList();

    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            // onPageChanged: (index, reason) {
            //   setState(() {
            //     _current = index;
            //   });
            // },
            height: height * 0.28,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: true,
            initialPage: 0,
            autoPlay: true,
            viewportFraction: 0.8),
        items: imageSliders,
      ),
    ]);
  }
}
