// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, avoid_print, unused_element, no_leading_underscores_for_local_identifiers, invalid_return_type_for_catch_error, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/View/HomePage/Auth/signuppage.dart';
import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // Future<void> login() async {
  //   if (_loginKey.currentState!.validate()) {
  //     String tenantValue = getStringAsync(tenantName).toString();
  //     ref.read(userNotifierProvider.notifier).login(
  //           usernameCtrl.value.text,
  //           tenantValue.toString(),
  //           passwordCtrl.value.text,
  //           context,
  //         );

  //   }
  // }

  bool offsecureText1 = true;

  Icon lockIcon = LockIcon().lock;
  void _onlockPressed1() {
    if (offsecureText1 == true) {
      setState(() {
        offsecureText1 = false;
        lockIcon = LockIcon().open;
      });
    } else {
      setState(() {
        offsecureText1 = true;
        lockIcon = LockIcon().lock;
      });
    }
  }

  @override
  void dispose() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                Container(
                  height: height * 0.2,
                  width: double.infinity,
                  color: mainColor,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.005),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                          ),
                          horizontalSpace(width: 10),
                          Text(
                            "धर्म दर्शन",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/priest.svg",
                            height: height * 0.09,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "नमस्कार !",
                                  style: TextStyle(
                                      color: secondColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.4,
                                      fontSize: 19.sp),
                                ),
                                Text(
                                  "कृपया लग-इन गर्नुहोस्",
                                  style: TextStyle(
                                      color: secondColor,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                      fontSize: 11.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: usernameCtrl,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: "प्रयोगकर्ताको नाम",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mainColor)),
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            )

                            // hintStyle: getSimple(context, 0.02)
                            //     .copyWith(fontFamily: "Light")),
                            ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        controller: passwordCtrl,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: IconButton(
                                icon: lockIcon,
                                color: secondColor,
                                onPressed: () => _onlockPressed1()),
                            hintText: "पासवर्ड",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mainColor)),
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            )
                            // hintStyle: getSimple(context, 0.02)
                            //     .copyWith(fontFamily: "Light")),
                            ),
                        obscureText: offsecureText1,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6,
                              errorText:
                                  "Password should be minimum 6 characters"),
                        ]),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "पासवर्ड भुल्नु भयो ?",
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  color: secondColor,
                                  fontSize: 11.sp),
                            )),
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: width * 0.025,
                                  horizontal: width * 0.04),
                              child: Text(
                                "लग - इन",
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "खाता छैन ?  ",
                            style: TextStyle(
                                color: secondColor,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.1,
                                fontSize: 12.sp),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              "साइन अप गर्नुहोस्",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: secondColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.1,
                                  fontSize: 12.sp),
                            ),
                          )
                          // TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       "साइन अप गर्नुहोस्",
                          //       style: TextStyle(
                          //         color: secondColor,
                          //       ),
                          //     )),
                        ],
                      ),
                      SizedBox(height: height * 0.04),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: (BorderRadius.circular(5)),
                          color: secondColor,
                        ),
                        child: TextButton(
                          onPressed: () {
                            // AuthService().signInWithGoogle();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/facebook.svg',
                                height: height * 0.03,
                                width: width * 0.04,
                              ),
                              SizedBox(width: width * 0.03),
                              Text('फेसबुक मार्फत लगइन गर्नुहोस्',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      letterSpacing: 0.2,
                                      fontFamily: "Light",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.015),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: (BorderRadius.circular(5)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // AuthService().signInWithGoogle();
                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: mainColor, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/google.svg',
                                height: height * 0.03,
                                width: width * 0.04,
                              ),
                              SizedBox(width: width * 0.03),
                              Text('गुगल मार्फत लगइन गर्नुहोस्',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    letterSpacing: 0.2,
                                    fontFamily: "Light",
                                    fontSize: 12.sp,
                                    color: secondColor,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class LockIcon {
  Icon lock = Icon(
    Icons.visibility_off,
  );
  Icon open = Icon(
    Icons.visibility,
  );
}
