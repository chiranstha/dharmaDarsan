import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/View/HomePage/BlogPage/blogpage.dart';
import 'package:hamro_patro/View/HomePage/DateConvert/DateConvert.dart';
import 'package:hamro_patro/View/HomePage/JyotishPage/jyotishpage.dart';
import 'package:hamro_patro/View/HomePage/Mantra/mantrapage.dart';
import 'package:hamro_patro/View/HomePage/ProgramPage/eventpage.dart';
import 'package:hamro_patro/View/HomePage/Tirthapage/tirthapage.dart';
import 'package:hamro_patro/View/HomePage/VideoPage/videopage.dart';
import 'package:hamro_patro/View/HomePage/YoutubeVideo/youtubepage.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:sizer/sizer.dart';

import '../Navbar.dart';
import '../sait_screen/sait_screen.dart';
import 'BookPage/bookmain.dart';
import 'Gallery/gallerypage.dart';

Widget homefeatures(BuildContext context) {
  return Column(
    children: [
      Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFdb1304),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Row(
                children: [
                  Text(
                    "विशेषताहरु",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconsmaker(
                      "assets/images/rasifall.svg",
                      "राशिफल",
                      Home(
                        idx: 2,
                      ),
                      context,
                      true),
                  iconsmaker(
                      "assets/images/calendar.svg",
                      "पात्रो",
                      Home(
                        idx: 1,
                      ),
                      context,
                      true),
                  iconsmaker("assets/images/kalash.svg", "साइत",
                      const SaitScreen(), context, false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconsmaker("assets/images/bhajan.svg", "भजन",
                      const BookMainPage(), context, false),
                  iconsmaker("assets/images/mantra.svg", "मन्त्र",
                      const MantraPage(), context, false),
                  iconsmaker("assets/images/videor.svg", "भिडियो",
                      const VideoPage(), context, false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconsmaker("assets/images/temple.svg", "तीर्थ स्थल",
                      const TirthaPage(), context, false),
                  iconsmaker("assets/images/location.svg", "कार्यक्र्महरु",
                      const EventPage(), context, false),
                  iconsmaker("assets/images/priest.svg", "ज्योतिष",
                      const JyotishPage(), context, false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconsmaker("assets/images/calendar.svg", "मिति परिवर्तन ",
                      const DateConvertPage(), context, false),
                  iconsmaker("assets/images/blog.svg", "ब्लग", const BlogPage(),
                      context, false),
                  iconsmaker("assets/images/gallery.svg", "ग्यालेरी",
                      const EventGallery(), context, false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  iconsmaker("assets/images/video.svg", "यूट्यूब भिडियो",
                      const YoutubeVideoPage(), context, false),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

iconsmaker(
    String image, String text, Widget page, BuildContext context, bool isN) {
  return InkWell(
    onTap: () {
      isN
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
    },
    child: SizedBox(
      height: MediaQuery.of(context).size.width * 0.28,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   icon,
            //   size: 40,
            //   color: Color(0xFFb25a38),
            // ),
            SvgPicture.asset(
              image,
              height: 9.w,
            ),
            verticalSpace(height: 1.h),
            Text(text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    ),
  );
}
