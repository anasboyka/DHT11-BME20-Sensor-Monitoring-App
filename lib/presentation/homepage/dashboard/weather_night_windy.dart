import 'package:flutter/material.dart';

class WeatherNightWindy extends StatefulWidget {
  const WeatherNightWindy({Key? key}) : super(key: key);

  @override
  State<WeatherNightWindy> createState() => _WeatherNightWindyState();
}

class _WeatherNightWindyState extends State<WeatherNightWindy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('night windy'),
      ),
      body: Container(),
    );
  }
}
