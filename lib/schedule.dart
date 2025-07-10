import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  bool isEnabled;
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

  final quiz = QuizUnit(
    title: "Bahasa Inggris Dasar",
    category: ["Vocabulary", "Grammar"],
    questions: [
      QuestionData(
        type: QuestionType.textfield,
        data: {
          'image':
              'https://images.vexels.com/media/users/3/151669/isolated/preview/cffc3cd93f88d0f459a0f069810dd2b5-deer-animal-cartoon.png',
          'label': 'Rusa',
          'correctAnswer': 'deer',
        },
      ),
      QuestionData(
        type: QuestionType.arrangingWords,
        data: {
          'question': 'saya akan minum',
          'words': ['I', 'am', 'will', 'drink', 'was', 'drank'],
          'answers': 'i will drink',
        },
      ),
      QuestionData(
        type: QuestionType.matching,
        data: {
          'pairs': {
            'fishing': 'memancing',
            'swimming': 'berenang',
            'sand castle': 'istana pasir',
            'picnic': 'piknik',
            'fly a kite': 'menerbangkan layang layang',
          },
        },
      ),
    ],
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

  void markAsDone() {
    setState(() {
      for (int i = 0; i < scheduleItems.length; i++) {
        if (scheduleItems[i].isSelected) {
          scheduleItems[i].isEnabled = !scheduleItems[i].isEnabled;
        }
      }
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        markAsDone();
                        selectView = false;
                      },
                      child: Text(
                        "Tandai Sebagai Selesai",
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Row(
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
                    ),
                  ],
                )
                : Container(),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleItems.length,
                itemBuilder: (context, index) {
                  final item = scheduleItems[index];
                  return Card(
                    child: ListTile(
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
                                  ? SizedBox(
                                    height: 80,
                                    child: Column(
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 20,
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          QuizPage(
                                                            quizStage:
                                                                quiz.stages[0],
                                                            quizIndex: index,
                                                            shouldMarkCompleted:
                                                                false,
                                                          ),
                                                ),
                                                (Route<dynamic> route) => false,
                                              );
                                            },
                                            child: const Text(
                                              "Mulai",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 20,
                                          ),
                                          child: TextButton.icon(
                                            label: Text(
                                              "Edit Jadwal",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (
                                                  BuildContext context,
                                                ) {
                                                  //kalau ga pakai,setState tidak ada efek, pakai stateful builder supaya state lokal dalam dialog bisa ubah
                                                  //setState tidak akan rebuild dialog, karena dialog hanya di build satu kali dengan buildcontext context
                                                  //stateful builder juga berguna krn dibuat state lokal dan hanya lokal(dialog) yang di rebuild
                                                  return StatefulBuilder(
                                                    builder: (
                                                      context,
                                                      setState,
                                                    ) {
                                                      return AlertDialog(
                                                        title: Text(
                                                          "Edit Jadwal Belajar",
                                                        ),
                                                        content: SizedBox(
                                                          height: 100,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                      label: Text(
                                                                        "Input Jadwal",
                                                                      ),
                                                                    ),
                                                                controller:
                                                                    newSchedule,
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Transform.translate(
                                                                    offset:
                                                                        Offset(
                                                                          -17,
                                                                          0,
                                                                        ),
                                                                    child: TextButton.icon(
                                                                      onPressed: () async {
                                                                        var time = await showTimePicker(
                                                                          context:
                                                                              context,
                                                                          initialTime:
                                                                              TimeOfDay.now(),
                                                                        );
                                                                        if (time !=
                                                                            null) {
                                                                          setState(() {
                                                                            timeIspicked =
                                                                                true;
                                                                            selectedTime =
                                                                                "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                                                                          });
                                                                        }
                                                                      },
                                                                      label: Text(
                                                                        "Pilih Waktu",
                                                                      ),
                                                                      icon: Icon(
                                                                        Icons
                                                                            .timer,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  timeIspicked
                                                                      ? Text(
                                                                        selectedTime,
                                                                      )
                                                                      : Text(
                                                                        "",
                                                                      ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Text(
                                                              "Batal",
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              if (newSchedule
                                                                      .text
                                                                      .isNotEmpty &&
                                                                  timeIspicked) {
                                                                scheduleProvider.editSchedule(
                                                                  index,
                                                                  widget.day,
                                                                  ScheduleItem(
                                                                    time:
                                                                        selectedTime,
                                                                    title:
                                                                        newSchedule
                                                                            .text,
                                                                    isEnabled:
                                                                        true,
                                                                  ),
                                                                );
                                                                newSchedule
                                                                    .clear();
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              }
                                                            },
                                                            child: Text("Edit"),
                                                          ),
                                                        ],
                                                      ).animate().fadeIn(duration: 300.ms).scaleXY(begin: 0.8, end: 1.0);
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(Icons.edit, size: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : Icon(Icons.done, color: Colors.grey[400])),
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
                    ),
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
                              )
                              .animate()
                              .fadeIn(duration: 300.ms)
                              .scaleXY(begin: 0.8, end: 1.0);
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
