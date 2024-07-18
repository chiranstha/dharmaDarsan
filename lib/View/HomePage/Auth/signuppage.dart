// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, avoid_print, unused_element, no_leading_underscores_for_local_identifiers, invalid_return_type_for_catch_error, unnecessary_null_comparison

import "package:hooks_riverpod/hooks_riverpod.dart";
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

import 'package:hamro_patro/Widgets/calendar%20widget/widgets/widget_space.dart';
import 'package:hamro_patro/Widgets/constants.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
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
                            "साइन अप",
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
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "कृपया विवरण भर्नुहोस्",
                        style: TextStyle(
                            color: secondColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3,
                            fontSize: 13.sp),
                      ),
                      SizedBox(
                        height: height * 0.02,
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
                        textInputAction: TextInputAction.next,
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
                      SizedBox(
                        height: height * 0.02,
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
                            hintText: "इमेल ठेगाना",
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
                        controller: usernameCtrl,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: "फोन नम्बर",
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
                        height: height * 0.025,
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
                                "साइन - अप",
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            )),
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
