import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/homepage/dashboard/weather_day_hot.dart';
import 'package:weather_app/presentation/homepage/dashboard/weather_day_rain.dart';
import 'package:weather_app/presentation/homepage/dashboard/weather_day_windy.dart';
import 'package:weather_app/presentation/homepage/homepage.dart';
import 'package:weather_app/presentation/wrapperhome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => WrapperStartup());
      case '/weatherrain':
        return CupertinoPageRoute(
          builder: (_) => WeatherRain(
            weather: args as Weather,
          ),
        );
      case '/weatherwindy':
        return CupertinoPageRoute(
          builder: (_) => WeatherWindy(
            weather: args as Weather,
          ),
        );
      case '/weatherhot':
        return CupertinoPageRoute(
          builder: (_) => WeatherHot(
            weather: args as Weather,
          ),
        );
      default:
        return CupertinoPageRoute(builder: (_) => MyHomePage());
    }
  }
}
