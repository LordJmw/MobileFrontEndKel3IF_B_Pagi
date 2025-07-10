import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas2/feat/register.dart';
import 'package:tugas2/homePage.dart';
import 'package:tugas2/schedule.dart';
import 'package:tugas2/scheduleProvider.dart';
import 'package:tugas2/scheduleTab.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(),
        ), // ✅ Register your provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
