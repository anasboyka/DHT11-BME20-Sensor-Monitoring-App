import 'package:flutter/material.dart';

const kcWhite = Colors.white;
const kcBlakc = Colors.black;
const kcDivider = Color(0xFFF4F4F4);
const kcPrimary = Color(0xff192C46);
const kcblue2 = Color(0xff243E77);
const kcblue3 = Color(0xff273F6E);
const kcblue4 = Color(0xff384869);
const kcblue5 = Color(0xff81A9F6);
const kcYellowtop = Color(0xffF7DC74);
const kcOrangebtm = Color(0xffFDB58C);
const kcGreentop = Color(0xff98FFEF);
const kcGreenbtm = Color(0xff12BCBA);
const kcBluetop = Color(0xff45DFFF);
const kcBluebtm = Color(0xff24AAEB);
const kcStatusWeatherText = Color(0xff2A2A56);

MaterialColor kcPrimarySwatch = createMaterialColor(kcPrimary);
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
