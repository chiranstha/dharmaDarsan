import 'package:flutter/material.dart';

Widget verticalSpace({double? height}) {
  return SizedBox(height: height ?? 5.0);
}

Widget horizontalSpace({double? width}) {
  return SizedBox(width: width ?? 5.0);
}
