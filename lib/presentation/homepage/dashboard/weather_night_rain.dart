import 'package:flutter/material.dart';

class WeatherNightRain extends StatefulWidget {
  const WeatherNightRain({Key? key}) : super(key: key);

  @override
  State<WeatherNightRain> createState() => _WeatherNightRainState();
}

class _WeatherNightRainState extends State<WeatherNightRain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('night rain'),
      ),
      body: Container(),
    );
  }
}
