import 'package:flutter/material.dart';
import 'package:project_kel2_mfe/feat/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
