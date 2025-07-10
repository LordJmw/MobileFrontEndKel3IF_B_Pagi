import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tugas2/components/check_button.dart';
import 'package:tugas2/components/press_effect.dart';
import 'package:tugas2/homePage.dart';
import 'package:tugas2/zbhal.dart';

class TileState extends ChangeNotifier {
  final Map<String, String> pairs;
  final List<String> nextQuestion;
  final List<String> nextAnswer;
  final StopWatchTimer longDelay = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
  );
  StreamSubscription<bool>? _fetchEnded;
  Set<String> completedSet = {};
  Set<String> correctSet = {};
  Set<String> checkedSet = {};
  String selectedQuestion = "";
  String selectedAnswer = "";
  final Map<String, String> newPair = {};
  String _tmpQuestion = "";
  String _tmpAnswer = "";
  bool isSwapped = false;
  double progress = 0;

  void changeSelected(value, isQuestion) {
    if (isQuestion) {
      selectedQuestion = value;
    } else {
      selectedAnswer = value;
    }
    notifyListeners();
  }

  void checkAnswer() {
    if (pairs[selectedQuestion] == selectedAnswer) {
      correctSet.add(selectedQuestion);
      correctSet.add(selectedAnswer);
      completedSet.add(selectedAnswer);
      completedSet.add(selectedQuestion);
      progress += (100 / pairs.length) / 100;

      if (nextQuestion.length > 0) {
        changeQuestion(selectedQuestion, selectedAnswer);
      }
    }

    checkedSet.add(selectedQuestion);
    checkedSet.add(selectedAnswer);
    selectedAnswer = "";
    selectedQuestion = "";
    notifyListeners();

    Future.delayed(Duration(milliseconds: 500), () {
      checkedSet = {};
      correctSet = {};
      notifyListeners();
    });
  }

  void changeQuestion(String prevQuestion, String prevAnswer) {
    String question = "";
    String answer = "";
    if (longDelay.isRunning) {
      longDelay.onResetTimer();
      if (nextAnswer.length > 1 && !isSwapped) {
        answer = nextAnswer[1];
        nextAnswer.removeAt(1);
        isSwapped = true;
      } else {
        answer = nextAnswer[0];
        nextAnswer.removeAt(0);
        isSwapped = false;
      }
      question = nextQuestion[0];
      nextQuestion.removeAt(0);
      newPair[_tmpQuestion] = question;
      newPair[_tmpAnswer] = answer;
      notifyListeners();
      if (nextAnswer.length == 0) {
        return;
      }
    }
    _fetchEnded?.cancel();
    longDelay.onStartTimer();
    newPair.clear();
    _tmpAnswer = prevAnswer;
    _tmpQuestion = prevQuestion;
    _fetchEnded = longDelay.fetchEnded.listen((value) {
      question = nextQuestion[0];
      answer = nextAnswer[0];
      nextQuestion.removeAt(0);
      nextAnswer.removeAt(0);
      newPair[prevQuestion] = question;
      newPair[prevAnswer] = answer;
      longDelay.onResetTimer();
      isSwapped = false;
      notifyListeners();
    });
  }

  void dispose() async {
    super.dispose();
    await longDelay.dispose();
  }

  TileState({
    required this.pairs,
    required this.nextQuestion,
    required this.nextAnswer,
  });
}

class TimerMatching extends StatefulWidget {
  final Map<String, String> pairs;
  const TimerMatching({super.key, required this.pairs});

  @override
  State<TimerMatching> createState() => _TimerMatchingState();
}

class _TimerMatchingState extends State<TimerMatching> {
  late TileState notifier;
  List<String> nextQuestion = [];
  List<String> nextAnswer = [];
  Map<String, String> initialPairs = {};
  Map<String, String> nextPairs = {};
  List<String> questionPlaceholder = [];
  List<String> answerPlaceholder = [];
  final StopWatchTimer timer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(90),
  );
  bool isCompleted = false;
  late int secondTime;
  bool _show = false;

  @override
  void initState() {
    super.initState();
    timer.onStartTimer();
    timer.secondTime.listen((value) {
      setState(() {
        secondTime = value;
      });
    });
    timer.fetchEnded.listen((value) {
      setState(() {
        timer.onStopTimer();
        _show = true;
      });
    });
    initialPairs = Map.fromEntries(widget.pairs.entries.take(5));
    nextPairs = Map.fromEntries(widget.pairs.entries.skip(5));
    nextQuestion = nextPairs.keys.toList();
    nextAnswer = nextPairs.values.toList();
    questionPlaceholder = initialPairs.keys.toList()..shuffle();
    answerPlaceholder = initialPairs.values.toList()..shuffle();

    notifier = TileState(
      pairs: widget.pairs,
      nextAnswer: nextAnswer,
      nextQuestion: nextQuestion,
    );

    notifier.addListener(() {
      setState(() {
        if (notifier.completedSet.length == widget.pairs.length * 2) {
          isCompleted = true;
          timer.onStopTimer();
          _show = true;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _show
              ? null
              : AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.clear, size: 42, color: Colors.grey[400]),
                ),
                title: LinearProgressIndicator(
                  value: notifier.progress,
                  minHeight: 18,
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(28, 176, 246, 1),
                  backgroundColor: Color.fromRGBO(229, 229, 229, 1),
                ),
                actions: [
                  SizedBox(
                    width: 68,
                    child: Text(
                      "${StopWatchTimer.getDisplayTimeMinute(StopWatchTimer.getMilliSecFromSecond(secondTime))}:${StopWatchTimer.getDisplayTimeSecond(StopWatchTimer.getMilliSecFromSecond(secondTime))}",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Jellee",
                        color: Colors.purple[300],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Pilih pasangan yang cocok",
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: "Jellee",
                    color: Color.fromRGBO(75, 75, 75, 1),
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: PressEffect(
                                offset: 4,
                                child:
                                    (toggle) => MatchingTiles(
                                      notifier: notifier,
                                      init_tileValue: questionPlaceholder[i],
                                      isQuestion: true,
                                      pressEffectController: toggle,
                                    ),
                              ),
                            ),
                            SizedBox(width: 80),

                            Expanded(
                              child: PressEffect(
                                offset: 4,
                                child:
                                    (toggle) => MatchingTiles(
                                      notifier: notifier,
                                      init_tileValue: answerPlaceholder[i],
                                      isQuestion: false,
                                      pressEffectController: toggle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet:
          _show
              ? Container(
                padding: EdgeInsets.all(24),
                color: Color.from(
                  alpha: 1,
                  red: 0.11,
                  green: 0.69,
                  blue: 0.965,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tantangan\nSelesai!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Jellee",
                              color: Colors.white,
                              fontSize: 42,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Pencocokkan",
                                style: TextStyle(
                                  fontFamily: "Jellee",
                                  color: Colors.orange[100],
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${notifier.completedSet.length / 2.round()}",
                                    style: TextStyle(
                                      fontFamily: "Jellee",
                                      color: Colors.orange[100],
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.orange[100],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Waktu",
                                style: TextStyle(
                                  fontFamily: "Jellee",
                                  color: Colors.orange[100],
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${StopWatchTimer.getDisplayTimeMinute(StopWatchTimer.getMilliSecFromSecond(secondTime))}:${StopWatchTimer.getDisplayTimeSecond(StopWatchTimer.getMilliSecFromSecond(secondTime))}",
                                    style: TextStyle(
                                      fontFamily: "Jellee",
                                      color: Colors.orange[100],
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.orange[100],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  "KEMBALI",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Jellee",
                                    letterSpacing: 2,
                                    color: Color.from(
                                      alpha: 1,
                                      red: 0.11,
                                      green: 0.69,
                                      blue: 0.965,
                                    ),
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              : null,
    );
  }
}

class MatchingTiles extends StatefulWidget {
  final TileState notifier;
  final String init_tileValue;
  final bool isQuestion;
  final PressEffectNotifier pressEffectController;
  const MatchingTiles({
    super.key,
    required this.notifier,
    required this.init_tileValue,
    required this.isQuestion,
    required this.pressEffectController,
  });

  @override
  State<MatchingTiles> createState() => _MatchingTilesState();
}

class _MatchingTilesState extends State<MatchingTiles> {
  bool isSelected = false;
  bool isDisabled = false;
  bool isCorrect = false;
  bool isChecked = false;
  bool isCompleted = false;
  late String tileValue;

  @override
  void initState() {
    super.initState();
    tileValue = widget.init_tileValue;

    widget.notifier.addListener(() {
      setState(() {
        isSelected =
            tileValue == widget.notifier.selectedQuestion ||
            tileValue == widget.notifier.selectedAnswer;
        isCorrect = widget.notifier.correctSet.contains(tileValue);
        isChecked = widget.notifier.checkedSet.contains(tileValue);
        isCompleted = widget.notifier.completedSet.contains(tileValue);

        if (isSelected) {
          widget.pressEffectController.changeShadowColor(
            Color.fromRGBO(28, 176, 246, 1),
          );
        } else if (isChecked) {
          isDisabled = true;
          if (isCorrect) {
            widget.pressEffectController.changeShadowColor(
              Color.fromRGBO(165, 237, 110, 1),
            );
          } else {
            widget.pressEffectController.changeShadowColor(
              Color.fromRGBO(255, 178, 178, 1),
            );
          }
        } else if (isDisabled && isCompleted) {
          widget.pressEffectController.changePressedState(true);
          if (widget.notifier.newPair.containsKey(tileValue)) {
            setState(() {
              tileValue = widget.notifier.newPair[tileValue]!;
              isDisabled = false;
              widget.pressEffectController.changePressedState(false);
              widget.pressEffectController.changeShadowColor(
                Color.fromRGBO(229, 229, 229, 1),
              );
            });
          }
        } else {
          setState(() {
            widget.pressEffectController.changeShadowColor(
              Color.fromRGBO(229, 229, 229, 1),
            );
            isDisabled = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8, 6, 8, 6),
      enabled: !isDisabled,
      selected: isSelected,
      tileColor:
          isChecked
              ? isCorrect
                  ? Color.fromRGBO(215, 255, 184, 1)
                  : Color.fromRGBO(255, 223, 224, 1)
              : Color.fromRGBO(254, 247, 255, 1),
      selectedTileColor: Color.fromRGBO(221, 243, 254, 1),
      title: Text(
        tileValue,
        textAlign: TextAlign.center,
        style: TextStyle(
          color:
              isChecked
                  ? isCorrect
                      ? Color.fromRGBO(90, 169, 4, 1)
                      : Color.fromRGBO(234, 43, 43, 1)
                  : isDisabled
                  ? Color.fromRGBO(229, 229, 229, .8)
                  : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color:
              isSelected
                  ? Color.fromRGBO(28, 176, 246, 1)
                  : isChecked
                  ? isCorrect
                      ? Color.fromRGBO(165, 237, 110, 1)
                      : Color.fromRGBO(255, 178, 178, 1)
                  : Color.fromRGBO(229, 229, 229, 1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        widget.notifier.changeSelected(tileValue, widget.isQuestion);
        widget.pressEffectController.press();

        if (widget.notifier.selectedQuestion != "" &&
            widget.notifier.selectedAnswer != "") {
          widget.notifier.checkAnswer();
        }
      },
    );
  }
}
