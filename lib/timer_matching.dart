import 'package:flutter/material.dart';
import 'package:tugas2/components/check_button.dart';
import 'package:tugas2/components/press_effect.dart';
import 'package:tugas2/models/quizQuestion.dart';

class TileState extends ChangeNotifier {
  final Map<String, String> listQuestion;
  Set<String> completedSet = {};
  Set<String> correctSet = {};
  Set<String> checkedSet = {};
  String selectedQuestion = "";
  String selectedAnswer = "";

  void changeSelected(value, isQuestion) {
    if (isQuestion) {
      selectedQuestion = value;
    } else {
      selectedAnswer = value;
    }
    notifyListeners();
  }

  void checkAnswer() {
    if (listQuestion[selectedQuestion] == selectedAnswer) {
      correctSet.add(selectedQuestion);
      correctSet.add(selectedAnswer);
      completedSet.add(selectedAnswer);
      completedSet.add(selectedQuestion);
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

  TileState({required this.listQuestion});
}

class TimerMatching extends StatefulWidget {
  final Map<String, String> pairs;
  const TimerMatching({super.key, required this.pairs});

  @override
  State<TimerMatching> createState() => _TimerMatchingState();
}

class _TimerMatchingState extends State<TimerMatching> {
  late TileState notifier;
  List<String> shuffledQuestion = [];
  List<String> shuffledAnswer = [];
  bool isCompleted = false;
  String buttonText = "PERIKSA";

  @override
  void initState() {
    super.initState();
    shuffledQuestion = widget.pairs.keys.toList()..shuffle();
    shuffledAnswer = widget.pairs.values.toList()..shuffle();
    notifier = TileState(listQuestion: widget.pairs);

    notifier.addListener(() {
      setState(() {
        if (notifier.completedSet.length == widget.pairs.length * 2) {
          isCompleted = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Jawaban Anda Benar"),
              backgroundColor: const Color.fromARGB(255, 2, 201, 9),
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              Column(
                children: [
                  for (int i = 0; i < widget.pairs.length; i++)
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
                                    tileValue: shuffledQuestion[i],
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
                                    tileValue: shuffledAnswer[i],
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

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
                child: PressEffect(
                  offset: 6,
                  child:
                      (toggle) => CheckButton(
                        pressEffectController: toggle,
                        buttonState: isCompleted,
                        label: buttonText,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchingTiles extends StatefulWidget {
  final TileState notifier;
  final String tileValue;
  final bool isQuestion;
  final PressEffectNotifier pressEffectController;
  const MatchingTiles({
    super.key,
    required this.notifier,
    required this.tileValue,
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

  @override
  void initState() {
    super.initState();

    widget.notifier.addListener(() {
      setState(() {
        isSelected =
            widget.tileValue == widget.notifier.selectedQuestion ||
            widget.tileValue == widget.notifier.selectedAnswer;
        isCorrect = widget.notifier.correctSet.contains(widget.tileValue);
        isChecked = widget.notifier.checkedSet.contains(widget.tileValue);
        isCompleted = widget.notifier.completedSet.contains(widget.tileValue);

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
        widget.tileValue,
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
        widget.notifier.changeSelected(widget.tileValue, widget.isQuestion);
        widget.pressEffectController.press();

        if (widget.notifier.selectedQuestion != "" &&
            widget.notifier.selectedAnswer != "") {
          widget.notifier.checkAnswer();
        }
      },
    );
  }
}
