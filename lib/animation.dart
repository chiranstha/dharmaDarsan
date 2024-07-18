// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hamro_patro/View/HomePage/Homepage.dart';
import 'package:sizer/sizer.dart';

class MyLogo extends StatefulWidget {
  const MyLogo({super.key});

  @override
  _MyLogoState createState() => _MyLogoState();
}

class _MyLogoState extends State<MyLogo> {
  bool _isZoomed = false;
  double _scale = 1.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 600), (timer) {
      setState(() {
        _isZoomed = !_isZoomed;
        _scale = _isZoomed ? 0.8 : 0.6;
      });
    });
  }

  void _stopTimer() {
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 70.h,
                  color: Colors.red,
                  child: Center(
                      child: Text(
                    "Hamro Patro",
                    style: TextStyle(color: Colors.black, fontSize: 50.sp),
                  ))),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                transform: Matrix4.identity()
                  ..scale(_scale)
                  ..rotateZ(_isZoomed ? 1.2 : 0.0),
                // ..rotateZ(0.78),
                transformAlignment: Alignment.center,
                // decoration: BoxDecoration(
                //   // shape: BoxShape.circle,
                //   color: Colors.blue,
                // ),
                child: Image.asset(
                  'assets/images/astrology.png',
                  height: 10.h,
                  width: 20.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
