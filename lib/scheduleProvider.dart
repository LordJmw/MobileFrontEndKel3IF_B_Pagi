import 'package:flutter/material.dart';
import 'package:tugas2/schedule.dart';

class ScheduleProvider with ChangeNotifier {
  final Map<String, List<ScheduleItem>> DaysdefaultSchedule = {
    "Senin": [
      ScheduleItem(
        time: '08.00',
        title: 'Belajar Grammar Part 1',
        isEnabled: true,
      ),
      ScheduleItem(time: '10.00', title: 'Latih Vocab', isEnabled: true),
    ],
    "Selasa": [
      ScheduleItem(
        time: '08.00',
        title: 'Belajar Grammar Part 1.1',
        isEnabled: true,
      ),
      ScheduleItem(time: '10.00', title: 'Reading Text 1', isEnabled: true),
    ],
    "Rabu": [
      ScheduleItem(
        time: '08.00',
        title: 'Belajar Grammar Part 1.2',
        isEnabled: true,
      ),
      ScheduleItem(time: '10.00', title: 'Latih Vocab', isEnabled: true),
    ],

    "Kamis": [
      ScheduleItem(time: '08.00', title: 'Reading Text 2', isEnabled: true),
      ScheduleItem(time: '10.00', title: 'Kerjakan Review 1', isEnabled: true),
    ],
    "Jumat": [
      ScheduleItem(
        time: '08.00',
        title: 'Belajar Grammar Part 1.3',
        isEnabled: true,
      ),
      ScheduleItem(time: '10.00', title: 'Reading Text 2', isEnabled: true),
    ],
    "Sabtu": [
      ScheduleItem(time: '08.00', title: 'Review Vocabulary', isEnabled: true),
      ScheduleItem(time: '10.00', title: 'Review Chapter 1', isEnabled: true),
    ],
    "Minggu": [
      ScheduleItem(
        time: '08.00',
        title: 'Reading Introduction to Chapter 2',
        isEnabled: true,
      ),
      ScheduleItem(time: '10.00', title: 'Listening Part A', isEnabled: true),
    ],
  };

  List<ScheduleItem> getScheduleForDay(String day) {
    return DaysdefaultSchedule[day] ?? [];
  }

  void addSchedule(String day, ScheduleItem item) {
    DaysdefaultSchedule[day]?.add(item);
    notifyListeners();
  }

  void editSchedule(int index, String day, ScheduleItem item) {
    DaysdefaultSchedule[day]![index] = item;
    notifyListeners();
  }

  void removeSchedule(String day, ScheduleItem item) {
    DaysdefaultSchedule[day]?.remove(item);
    notifyListeners();
  }
}
