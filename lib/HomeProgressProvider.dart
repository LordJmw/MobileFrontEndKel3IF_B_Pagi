import 'package:flutter/material.dart';

class ProgressProvider with ChangeNotifier {
  double progress = 16.66;
  List<bool> completedUnits = [true, false, false, false, false, false];

  void updateProgress(int completedUnitIndex) {
    if (completedUnitIndex >= 0 && completedUnitIndex < completedUnits.length) {
      completedUnits[completedUnitIndex + 1] = true;
      progress = (progress + 16.66).clamp(0, 100).toDouble();
      // print(
      //   "Updated progress: $progress, completedUnits: $completedUnits, index : $completedUnitIndex",
      // );
      notifyListeners();
    } else {
      print("Invalid completedUnitIndex: $completedUnitIndex");
    }
  }
}
