import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas2/models/quizQuestion.dart';
import 'package:tugas2/quizPage.dart';
import 'package:tugas2/scheduleProvider.dart';

class Schedule extends StatefulWidget {
  final String day;
  const Schedule({super.key, required this.day});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class ScheduleItem {
  final String time;
  final String title;
  final bool isEnabled;
  bool isSelected;

  ScheduleItem({
    required this.time,
    required this.title,
    required this.isEnabled,
    this.isSelected = false,
  });
}

class _ScheduleState extends State<Schedule> {
  bool selectView = false;
  TextEditingController newSchedule = TextEditingController(text: "");

  final QuizUnit quizUnit = QuizUnit(
    title: "Halo Nama Saya...",
    category: ["Simple Present", "Simple Past", "Self-Introduced"],
  );

  List<ScheduleItem> scheduleItems = [];

  String countSelected() {
    int count = scheduleItems.where((item) => item.isSelected).length;
    return "$count dipilih";
  }

  void cancelSelection() {
    setState(() {
      selectView = false;
      for (var item in scheduleItems) {
        item.isSelected = false;
      }
    });
  }

  void selectAll() {
    setState(() {
      for (var item in scheduleItems) {
        item.isSelected = true;
      }
    });
  }

  void deleteSelected() {
    setState(() {
      scheduleItems.removeWhere((item) => item.isSelected);
      selectView = false;
    });
  }

  formatTimeToString(TimeOfDay selectedTime) {
    return "${selectedTime.hour}:${selectedTime.minute}";
  }

  String selectedTime = "";
  bool timeIspicked = false;

  @override
  Widget build(BuildContext context) {
    ScheduleProvider scheduleProvider = Provider.of<ScheduleProvider>(context);

    scheduleItems = scheduleProvider.getScheduleForDay("${this.widget.day}");

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            selectView
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("Batal"),
                      onPressed: () {
                        cancelSelection();
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        selectAll();
                      },
                      child: Text("Pilih Semua"),
                    ),
                  ],
                )
                : Container(),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleItems.length,
                itemBuilder: (context, index) {
                  final item = scheduleItems[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.only(bottom: 16),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.time,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            color:
                                item.isEnabled
                                    ? Colors.black87
                                    : Colors.grey[400],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                item.isEnabled
                                    ? Colors.grey[600]
                                    : Colors.grey[400],
                          ),
                        ),
                        TextButton.icon(
                          label: Text(
                            "Edit Jadwal",
                            style: TextStyle(fontSize: 10),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                //kalau ga pakai,setState tidak ada efek, pakai stateful builder supaya state lokal dalam dialog bisa ubah
                                //setState tidak akan rebuild dialog, karena dialog hanya di build satu kali dengan buildcontext context
                                //stateful builder juga berguna krn dibuat state lokal dan hanya lokal(dialog) yang di rebuild
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text("Edit Jadwal Belajar"),
                                      content: SizedBox(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text("Input Jadwal"),
                                              ),
                                              controller: newSchedule,
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Transform.translate(
                                                  offset: Offset(-17, 0),
                                                  child: TextButton.icon(
                                                    onPressed: () async {
                                                      var time =
                                                          await showTimePicker(
                                                            context: context,
                                                            initialTime:
                                                                TimeOfDay.now(),
                                                          );
                                                      if (time != null) {
                                                        setState(() {
                                                          timeIspicked = true;
                                                          selectedTime =
                                                              "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                                                        });
                                                      }
                                                    },
                                                    label: Text("Pilih Waktu"),
                                                    icon: Icon(Icons.timer),
                                                  ),
                                                ),
                                                timeIspicked
                                                    ? Text(selectedTime)
                                                    : Text(""),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Batal"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (newSchedule.text.isNotEmpty &&
                                                timeIspicked) {
                                              scheduleProvider.editSchedule(
                                                index,
                                                widget.day,
                                                ScheduleItem(
                                                  time: selectedTime,
                                                  title: newSchedule.text,
                                                  isEnabled: true,
                                                ),
                                              );
                                              newSchedule.clear();
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text("Edit"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit, size: 14),
                        ),
                      ],
                    ),
                    trailing:
                        selectView
                            ? Checkbox(
                              value: item.isSelected,
                              activeColor: const Color.fromRGBO(
                                28,
                                176,
                                246,
                                1,
                              ),
                              onChanged: (val) {
                                setState(() {
                                  item.isSelected = val!;
                                });
                              },
                            )
                            : (item.isEnabled
                                ? Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (_) => QuizPage(
                                                  quizStage: quizUnit.stages[0],
                                                ),
                                          ),
                                        );
                                      },
                                      child: const Text("Mulai"),
                                    ),
                                  ],
                                )
                                : null),
                    onLongPress: () {
                      setState(() {
                        selectView = true;
                        item.isSelected = true;
                      });
                    },
                    onTap: () {
                      if (selectView) {
                        setState(() {
                          item.isSelected = !item.isSelected;
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          selectView
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: SizedBox(
                      width: 120,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            scheduleItems.removeWhere(
                              (item) => item.isSelected == true,
                            );
                            selectView = false;
                          });
                        },
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromRGBO(72, 72, 72, 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.delete), Text("Hapus")],
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //kalau ga pakai,setState tidak ada efek, pakai stateful builder supaya state lokal dalam dialog bisa ubah
                      //setState tidak akan rebuild dialog, karena dialog hanya di build satu kali dengan buildcontext context
                      //stateful builder juga berguna krn dibuat state lokal dan hanya lokal(dialog) yang di rebuild
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Tambah Jadwal Belajar"),
                            content: SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      label: Text("Input Jadwal"),
                                    ),
                                    controller: newSchedule,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(-17, 0),
                                        child: TextButton.icon(
                                          onPressed: () async {
                                            var time = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            if (time != null) {
                                              setState(() {
                                                timeIspicked = true;
                                                selectedTime =
                                                    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                                              });
                                            }
                                          },
                                          label: Text("Pilih Waktu"),
                                          icon: Icon(Icons.timer),
                                        ),
                                      ),
                                      timeIspicked
                                          ? Text(selectedTime)
                                          : Text(""),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Batal"),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (newSchedule.text.isNotEmpty &&
                                      timeIspicked) {
                                    scheduleProvider.addSchedule(
                                      widget.day,
                                      ScheduleItem(
                                        time: selectedTime,
                                        title: newSchedule.text,
                                        isEnabled: true,
                                      ),
                                    );
                                    newSchedule.clear();
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("Tambah"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                backgroundColor: Colors.blue,
                elevation: 6,
                child: Icon(Icons.add, color: Colors.white, size: 28),
              ),
    );
  }
}
