import 'package:flutter/material.dart';
import 'package:tugas2/Profile.dart';
import 'package:tugas2/feat/register.dart';
import 'package:tugas2/homePage.dart';
import 'package:tugas2/zbhal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Golda(),
      debugShowCheckedModeBanner: false,
    );
  }
}
