import 'package:flutter/material.dart';
import 'package:project_kel2_mfe/arranging_words.dart';
import 'package:project_kel2_mfe/feat/register.dart';
import 'package:project_kel2_mfe/homePage.dart';
import 'package:project_kel2_mfe/zbhal.dart';

void main() {
  runApp(const MyApp());
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
