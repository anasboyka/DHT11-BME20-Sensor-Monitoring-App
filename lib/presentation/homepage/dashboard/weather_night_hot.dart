import 'package:flutter/material.dart';

class WeatherNightHot extends StatefulWidget {
  const WeatherNightHot({Key? key}) : super(key: key);

  @override
  State<WeatherNightHot> createState() => _WeatherNightHotState();
}

class _WeatherNightHotState extends State<WeatherNightHot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('night hot'),
      ),
      body: Container(),
    );
  }
}
