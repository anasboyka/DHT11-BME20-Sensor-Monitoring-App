import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constant/constant_color.dart';
import 'package:weather_app/constant/constant_widget.dart';
import 'package:weather_app/data/local/shared_preferences.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherRain extends StatefulWidget {
  final Weather weather;

  const WeatherRain({Key? key, required this.weather}) : super(key: key);

  @override
  State<WeatherRain> createState() => _WeatherRainState();
}

class _WeatherRainState extends State<WeatherRain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kcBluetop,
              kcBluebtm,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gaphr(h: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.weather.placeName!,
                      style: kwtextStyleRD(
                        fs: 30,
                        fw: kfbold,
                        c: kcStatusWeatherText,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                          onPressed: () async {
                            print('tap');
                            await Spreferences.setStartup(true);
                            if (!mounted) return;
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          icon: const Icon(Icons.logout)),
                    )
                  ],
                ),
                gaphr(h: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('d MMM, EEEE').format(DateTime.now()),
                    style: kwtextStyleRD(
                      fs: 20,
                      fw: kfmedium,
                      c: kcStatusWeatherText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.w,
                  child: Lottie.asset('assets/lottie/4803-weather-storm.json'),
                ),
                Text(
                  "Thunderstorm!",
                  style: kwtextStyleRD(
                    fs: 20,
                    fw: kfbold,
                    c: kcStatusWeatherText,
                  ),
                ),
                Text(
                  "${widget.weather.temperature.round().toString()}\u00B0c", //u2103
                  style: GoogleFonts.quicksand(
                    color: kcStatusWeatherText,
                    fontSize: 84,
                    fontWeight: kfbold,
                  ),
                ),
                gaphr(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/humidity.png', width: 24),
                    gapwr(w: 10),
                    Text(
                      "${widget.weather.humidity.round().toString()}%",
                      style: GoogleFonts.quicksand(
                        color: kcStatusWeatherText,
                        fontSize: 30,
                        fontWeight: kfextrabold,
                      ),
                    )
                  ],
                ),
                gaphr(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/pressure.png', width: 24),
                    gapwr(w: 10),
                    Text(
                      "${widget.weather.pressure.toStringAsFixed(2)} hPa",
                      style: GoogleFonts.quicksand(
                        color: kcStatusWeatherText,
                        fontSize: 30,
                        fontWeight: kfextrabold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
