import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constant/constant_color.dart';

SizedBox gapw({double w = 20}) {
  return SizedBox(
    width: w,
  );
}

SizedBox gaph({double h = 20}) {
  return SizedBox(
    height: h,
  );
}

const kwDivider = Divider(
  color: kcDivider,
  endIndent: 0,
  height: 0,
  indent: 0,
  thickness: 1,
);

const kfThin = FontWeight.w100;
const kfExtraLight = FontWeight.w200;
const kfLight = FontWeight.w300;
const kfregular = FontWeight.w400;
const kfmedium = FontWeight.w500;
const kfsemibold = FontWeight.w600;
const kfbold = FontWeight.bold;
const kfextrabold = FontWeight.w800;
const kfblack = FontWeight.w900;

const kwInset0 = EdgeInsets.zero;

TextStyle kwtextStyleRD(
    {double fs = 12,
    Color c = Colors.black,
    double? h,
    FontWeight? fw,
    String ff = 'SF Pro Text'}) {
  return TextStyle(
    fontFamily: ff,
    fontSize: fs.sp,
    color: c,
    height: h,
    fontWeight: fw,
  );
}

TextStyle kwtextStyleD(
    {double fs = 12, Color c = Colors.black, double? h, FontWeight? fw}) {
  return TextStyle(
    fontSize: fs,
    color: c,
    height: h,
    fontWeight: fw,
  );
}

SizedBox gapwr({double w = 20}) {
  return SizedBox(width: w.w);
}

SizedBox gaphr({double h = 20}) {
  return SizedBox(height: h.h);
}

Future kwShowSnackbar(BuildContext context, String message,
    {int seconds = 4}) async {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: seconds),
  ));
}
