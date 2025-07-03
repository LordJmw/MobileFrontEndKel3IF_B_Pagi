import 'package:flutter/material.dart';
import 'package:tugas2/schedule.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  final tabs = [
    Tab(text: "Senin"),
    Tab(text: "Selasa"),
    Tab(text: "Rabu"),
    Tab(text: "Kamis"),
    Tab(text: "Jumat"),
    Tab(text: "Sabtu"),
    Tab(text: "Minggu"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Schedule"),
            bottom: TabBar(tabs: tabs),
          ),
          body: TabBarView(
            children: [
              Schedule(day: "Senin"),
              Schedule(day: "Selasa"),
              Schedule(day: "Rabu"),
              Schedule(day: "Kamis"),
              Schedule(day: "Jumat"),
              Schedule(day: "Sabtu"),
              Schedule(day: "Minggu"),
            ],
          ),
        ),
      ),
    );
  }
}
