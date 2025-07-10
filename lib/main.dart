import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tugas2/HomeProgressProvider.dart';
import 'package:tugas2/feat/register.dart';
import 'package:tugas2/homePage.dart';
import 'package:tugas2/schedule.dart';
import 'package:tugas2/scheduleProvider.dart';
import 'package:tugas2/scheduleTab.dart';

void main() {
  configLoading();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleProvider()),
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
