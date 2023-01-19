import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:weather_app/constant/constant_color.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/remote/firebase/firestore/firestore.dart';
import 'package:weather_app/presentation/homepage/dashboard/weather_day_hot.dart';
import 'package:weather_app/presentation/homepage/dashboard/weather_day_rain.dart';
import 'package:weather_app/presentation/homepage/dashboard/weather_day_windy.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final controller = PageController();
  StreamSubscription? streamSubscription;
  Weather? currentWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreDb().weather,
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Weather weather = snapshot.data;
            if (weather.temperature >= 30) {
              return WeatherHot(weather: weather);
            } else if (weather.temperature > 25 && weather.temperature < 30) {
              return WeatherWindy(weather: weather);
            } else if (weather.temperature <= 25) {
              return WeatherRain(weather: weather);
            }
            return WeatherWindy(weather: weather);
          } else {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: kcBlakc,
            );
          }
        },
      ),
    );
  }

  streamWeather() {
    Stream<Weather?> streamWeather = FirestoreDb().weather;
    streamSubscription = streamWeather.listen((weather) {
      setState(() {
        currentWeather = weather;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription?.cancel().then((_) => streamSubscription = null);
    super.dispose();
  }
}
