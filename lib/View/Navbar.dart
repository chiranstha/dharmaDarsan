// ignore_for_file: file_names, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hamro_patro/View/HomePage/Auth/drawerpage.dart';
import 'package:hamro_patro/View/HomePage/Auth/loginpage.dart';
import 'package:sizer/sizer.dart';

import 'package:hamro_patro/View/HomePage/Homepage.dart';
import 'package:hamro_patro/View/RasifalPage/rasifalpage.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/screen/my_calendar/my_nepali_calendar.dart';

import 'HomePage/Profilepage.dart';

class Home extends StatefulWidget {
  Home({required this.idx, super.key});
  int idx;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screens = [
    const HomePage(),
    const MyNepaliCalendar(),
    const RasifalPage(),
    const ProfilePage()
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onItemTapped(int index) {
    setState(() {
      widget.idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: openDrawer(context),
        appBar: AppBar(
          elevation: 0,
          // automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFdb1304),
          title: Text(
            'धर्म दर्शन',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.1,
                fontSize: 18.sp),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // _scaffoldKey.currentState!.openDrawer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                icon: CircleAvatar(
                  radius: 4.w,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 3.w,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage('assets/images/user.png'),
                  ),
                )),
            IconButton(
                onPressed: () {
                  // DBProvider.db.gettoday();
                },
                icon: const Icon(Icons.notifications_none_outlined)),
          ],
        ),
        body: screens[widget.idx],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11.sp,
          currentIndex: widget.idx,
          unselectedFontSize: 9.sp,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'गृहपृष्ठ'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                ),
                label: 'क्यालेन्डर '),
            BottomNavigationBarItem(
                icon: Icon(Icons.cyclone), label: 'राशिफल '),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2,
                ),
                label: 'गुरु'),
          ],
          onTap: (index) {
            onItemTapped(index);
          },
        ),
      ),
    );
  }
}
