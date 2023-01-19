import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constant/constant_color.dart';
import 'package:weather_app/constant/constant_widget.dart';
import 'package:weather_app/data/local/shared_preferences.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/remote/firebase/firestore/firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _date, _time;
  final placeCon = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _date = _formatDate(DateTime.now());
    _time = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

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
              kcPrimary,
              kcblue2,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                gaphr(h: 70),
                Text(
                  'Current Sensor Reading',
                  style: kwtextStyleRD(fw: kfbold, fs: 34, c: kcWhite),
                ),
                gaphr(h: 34),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'DHT11 & BME280',
                    style: kwtextStyleRD(
                      c: kcWhite,
                      fs: 22,
                      fw: kfmedium,
                    ),
                  ),
                ),
                gaphr(),
                StreamBuilder(
                    stream: FirestoreDb().weather,
                    builder: (_, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        Weather weather = snapshot.data;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kcblue5, width: 1),
                            color: kcblue3,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                gaphr(h: 14),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _time,
                                    style: kwtextStyleRD(
                                      c: kcWhite,
                                      fs: 60,
                                      fw: kfbold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _date,
                                    style: kwtextStyleRD(
                                      fs: 16,
                                      c: kcWhite,
                                      fw: kfregular,
                                    ),
                                  ),
                                ),
                                gaphr(h: 10),
                                // Row(
                                //   children: [
                                Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kcPrimary,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 86.w,
                                          width: 86.w,
                                          decoration: BoxDecoration(
                                            color: kcblue4,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: Image.asset(
                                                  'assets/images/temperature.png'),
                                            ),
                                          ),
                                        ),
                                        gapwr(w: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Text(
                                              'Temperature',
                                              style: kwtextStyleRD(
                                                  c: kcWhite,
                                                  fs: 20,
                                                  fw: kfLight),
                                            ),
                                            Text(
                                              '${weather.temperature.round()}\u2103',
                                              style: kwtextStyleRD(
                                                c: kcWhite,
                                                fs: 26,
                                                fw: kfmedium,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                gaphr(),
                                //gapwr(w: 10),
                                Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kcPrimary,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 86.w,
                                          width: 86.w,
                                          decoration: BoxDecoration(
                                            color: kcblue4,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(7.w),
                                              child: Image.asset(
                                                  'assets/images/humidity.png'),
                                            ),
                                          ),
                                        ),
                                        gapwr(w: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Text(
                                              'Humidity',
                                              style: kwtextStyleRD(
                                                c: kcWhite,
                                                fs: 21,
                                                fw: kfLight,
                                              ),
                                            ),
                                            Text(
                                              '${weather.humidity.round()}%',
                                              style: kwtextStyleRD(
                                                c: kcWhite,
                                                fs: 26,
                                                fw: kfmedium,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                //   ],
                                // ),
                                gaphr(),
                                Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kcPrimary,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 86.w,
                                          width: 86.w,
                                          decoration: BoxDecoration(
                                            color: kcblue4,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(7.w),
                                              child: Image.asset(
                                                  'assets/images/pressure.png'),
                                            ),
                                          ),
                                        ),
                                        gapwr(w: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Text(
                                              'Pressure',
                                              style: kwtextStyleRD(
                                                c: kcWhite,
                                                fs: 21,
                                                fw: kfLight,
                                              ),
                                            ),
                                            Text(
                                              '${weather.pressure.toStringAsFixed(2)} hPa',
                                              style: kwtextStyleRD(
                                                c: kcWhite,
                                                fs: 26,
                                                fw: kfmedium,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                gaphr(h: 14),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    }),
                gaphr(),
                MaterialButton(
                  elevation: 3,
                  height: 60,
                  minWidth: double.infinity,
                  color: kcPrimary,
                  onPressed: () async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Register a place'),
                            content: SingleChildScrollView(
                              child: Form(
                                key: _formkey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('Place Name : '),
                                        gapwr(w: 10),
                                        Expanded(
                                          child: TextFormField(
                                            controller: placeCon,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return 'User cannot be empty';
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    gaphr(),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              MaterialButton(
                                color: kcPrimary,
                                textColor: Colors.white,
                                child: const Text('Add'),
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    await FirestoreDb()
                                        .registerPlace(placeCon.text);
                                    if (!mounted) return;
                                    kwShowSnackbar(context,
                                        "${placeCon.text} registered successfully");
                                    placeCon.clear();
                                    await Spreferences.setStartup(false);
                                    if (!mounted) return;
                                    Navigator.of(context).pop();
                                    Navigator.of(context)
                                        .pushReplacementNamed('/');
                                  }
                                },
                              ),
                            ],
                          );
                        });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: const BorderSide(color: kcWhite, width: 1),
                  ),
                  child: Text(
                    'Register New Place',
                    style: kwtextStyleRD(c: kcWhite, fw: kfbold, fs: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDate = _formatDate(now);
    final String formattedTime = _formatTime(now);
    if (!mounted) return;
    setState(() {
      _date = formattedDate;
      _time = formattedTime;
    });
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd MMMM, yyyy').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime).toLowerCase();
  }
}
