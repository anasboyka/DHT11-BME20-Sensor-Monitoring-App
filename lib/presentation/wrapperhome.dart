import 'package:flutter/material.dart';
import 'package:weather_app/data/local/shared_preferences.dart';
import 'package:weather_app/presentation/homepage/dashboard/dashboard.dart';
import 'package:weather_app/presentation/homepage/homepage.dart';

class WrapperStartup extends StatefulWidget {
  const WrapperStartup({Key? key}) : super(key: key);

  @override
  State<WrapperStartup> createState() => _WrapperStartupState();
}

class _WrapperStartupState extends State<WrapperStartup> {
  bool? startup = Spreferences.getStartup();
  @override
  Widget build(BuildContext context) {
    if (startup != null && startup == false) {
      return const Dashboard();
    } else {
      return const MyHomePage();
    }
  }
}
