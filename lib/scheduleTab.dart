import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas2/schedule.dart';
import 'package:tugas2/scheduleProvider.dart';

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

  TextEditingController newSchedule = TextEditingController(text: "");
  String selectedTime = "";
  bool timeIspicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: tabs.length,
        child: Builder(
          builder: (context) {
            ScheduleProvider scheduleProvider = Provider.of<ScheduleProvider>(
              context,
            );

            return Scaffold(
              appBar: AppBar(
                title: Text("Hari"),
                bottom: TabBar(tabs: tabs),
                actions: [
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder:
                        (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.bar_chart),
                              title: Text("Progress Tracking"),
                              onTap: () {},
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Pengaturan Notifikasi"),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.share),
                              title: Text("Share Jadwal"),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.calendar_month),
                              title: Text("Ekspor ke Kalender Lokal"),
                            ),
                          ),
                        ],
                  ),
                ],
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
            );
          },
        ),
      ),
    );
  }
}
