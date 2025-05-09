import 'package:flutter/material.dart';
import 'package:utsfrontend/components/check_button.dart';
import 'package:utsfrontend/components/press_effect.dart';
import 'package:utsfrontend/models/quizQuestion.dart';

class TileState extends ChangeNotifier {
  final Map<String, String> listQuestion;
  Set<String> completedQuestion = {};
  Set<String> correctSet = {};
  Set<String> checkedSet = {};
  bool tapState = true;
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
    bool isCorrect = listQuestion[selectedQuestion] == selectedAnswer;

    if (isCorrect) {
      correctSet.add(selectedQuestion);
      correctSet.add(selectedAnswer);
    }
    checkedSet.add(selectedQuestion);
    checkedSet.add(selectedAnswer);
    tapState = !tapState;

    notifyListeners();

    Future.delayed(Duration(milliseconds: 500), () {
      correctSet = {};
      checkedSet = {};
      tapState = !tapState;

      if (isCorrect) {
        completedQuestion.add(selectedQuestion);
        completedQuestion.add(selectedAnswer);
      } else {
        correctSet.add(selectedQuestion);
        correctSet.add(selectedAnswer);
      }
      selectedQuestion = "";
      selectedAnswer = "";

      notifyListeners();

      if (correctSet.isNotEmpty) {
        Future.delayed(Duration(milliseconds: 200), () {
          correctSet = {};
          notifyListeners();
        });
      }
    });
  }

  TileState({required this.listQuestion});
}

class MatchingQuestion extends StatefulWidget {
  final Map<String, String> pairs;
  final PageCounter pageCounter;
  const MatchingQuestion({
    super.key,
    required this.pairs,
    required this.pageCounter,
  });

  @override
  State<MatchingQuestion> createState() => _MatchingQuestionState();
}

class _MatchingQuestionState extends State<MatchingQuestion> {
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
        if (notifier.completedQuestion.length == widget.pairs.length * 2) {
          isCompleted = true;
          buttonText = "JAWABAN ANDA BENAR";
          widget.pageCounter.completed();
          Future.delayed(Duration(seconds: 1), () {
            widget.pageCounter.nextPage();
          });
        }
      });

      //   setState(() {
      //     if (notifier.completedQuestion.length == sampleQuestion.length * 2) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(
      //           backgroundColor: Color.fromRGBO(221, 243, 254, 1),
      //           duration: Duration(days: 1),
      //           content: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      //                 child: ListTile(
      //                   contentPadding: EdgeInsets.zero,
      //                   leading: CircleAvatar(
      //                     backgroundColor: Color.fromRGBO(28, 176, 246, 1),
      //                     foregroundColor: Colors.white,
      //                     radius: 15,
      //                     child: Icon(Icons.check_rounded, size: 20),
      //                   ),
      //                   title: Text(
      //                     "Hebat!",
      //                     style: TextStyle(
      //                       fontSize: 22,
      //                       color: Color.fromRGBO(28, 176, 246, 1),
      //                       fontFamily: "Jellee",
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               // CheckButton(state: true),
      //             ],
      //           ),
      //         ),
      //       );
      //     }
      //   });
    });
  }

  void completed() {}

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
  late bool isSelected;
  late bool isDisabled;
  late bool isCorrect;
  late bool isChecked;
  late bool tapState;

  @override
  void initState() {
    super.initState();

    isSelected =
        widget.tileValue == widget.notifier.selectedQuestion ||
        widget.tileValue == widget.notifier.selectedAnswer;
    isDisabled = widget.notifier.completedQuestion.contains(widget.tileValue);
    isCorrect = widget.notifier.correctSet.contains(widget.tileValue);
    isChecked = widget.notifier.checkedSet.contains(widget.tileValue);
    tapState = widget.notifier.tapState;

    widget.notifier.addListener(() {
      setState(() {
        isSelected =
            widget.tileValue == widget.notifier.selectedQuestion ||
            widget.tileValue == widget.notifier.selectedAnswer;
        isDisabled = widget.notifier.completedQuestion.contains(
          widget.tileValue,
        );
        isCorrect = widget.notifier.correctSet.contains(widget.tileValue);
        isChecked = widget.notifier.checkedSet.contains(widget.tileValue);
        tapState = widget.notifier.tapState;

        if (isSelected) {
          if (!isChecked) {
            widget.pressEffectController.changeShadowColor(
              Color.fromRGBO(28, 176, 246, 1),
            );
          } else {
            if (isCorrect) {
              widget.pressEffectController.changeShadowColor(
                Color.fromRGBO(165, 237, 110, 1),
              );
            } else {
              widget.pressEffectController.changeShadowColor(
                Color.fromRGBO(255, 178, 178, 1),
              );
            }
          }
        } else {
          widget.pressEffectController.changeShadowColor(
            Color.fromRGBO(229, 229, 229, 1),
          );
          if (isDisabled) {
            widget.pressEffectController.changePressedState(true);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8, 6, 8, 6),
      trailing:
          widget.isQuestion
              ? RadioButton(
                widget: widget,
                isDisabled: isDisabled,
                isChecked: isChecked,
                isCorrect: isCorrect,
                tapState: tapState,
              )
              : null,
      leading:
          !widget.isQuestion
              ? RadioButton(
                widget: widget,
                isDisabled: isDisabled,
                isChecked: isChecked,
                isCorrect: isCorrect,
                tapState: tapState,
              )
              : null,
      enabled: !isDisabled,
      selected: isSelected,
      tileColor: Color.fromRGBO(254, 247, 255, 1),
      selectedTileColor:
          isChecked
              ? isCorrect
                  ? Color.fromRGBO(215, 255, 184, 1)
                  : Color.fromRGBO(255, 223, 224, 1)
              : Color.fromRGBO(221, 243, 254, 1),
      title: Text(
        widget.tileValue,
        textAlign: widget.isQuestion ? TextAlign.end : TextAlign.start,
        style: TextStyle(
          color:
              isDisabled
                  ? Color.fromRGBO(229, 229, 229, .8)
                  : isChecked
                  ? isCorrect
                      ? Color.fromRGBO(90, 169, 4, 1)
                      : Color.fromRGBO(234, 43, 43, 1)
                  : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color:
              isSelected
                  ? isChecked
                      ? isCorrect
                          ? Color.fromRGBO(165, 237, 110, 1)
                          : Color.fromRGBO(255, 178, 178, 1)
                      : Color.fromRGBO(28, 176, 246, 1)
                  : Color.fromRGBO(229, 229, 229, 1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      onTap:
          !tapState
              ? null
              : () {
                widget.notifier.changeSelected(
                  widget.tileValue,
                  widget.isQuestion,
                );
                widget.pressEffectController.press();

                if (widget.notifier.selectedQuestion != "" &&
                    widget.notifier.selectedAnswer != "") {
                  widget.notifier.checkAnswer();
                }
              },
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.widget,
    required this.isDisabled,
    required this.isChecked,
    required this.isCorrect,
    required this.tapState,
  });

  final MatchingTiles widget;
  final bool isDisabled;
  final bool isChecked;
  final bool isCorrect;
  final bool tapState;

  @override
  Widget build(BuildContext context) {
    return Radio<String>(
      value: widget.tileValue,
      groupValue:
          widget.isQuestion
              ? widget.notifier.selectedQuestion
              : widget.notifier.selectedAnswer,
      fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected) &&
            !isDisabled &&
            !(isChecked == false && isCorrect == true)) {
          if (!isChecked) {
            return Color.fromRGBO(28, 176, 246, 1);
          } else {
            if (isCorrect) {
              return Color.fromRGBO(165, 237, 110, 1);
            } else {
              return Color.fromRGBO(255, 178, 178, 1);
            }
          }
        }
        return Color.fromRGBO(229, 229, 229, 1);
      }),
      onChanged:
          isDisabled || !tapState
              ? null
              : (value) {
                widget.pressEffectController.press();
                widget.notifier.changeSelected(value, widget.isQuestion);
                if (widget.notifier.selectedQuestion != "" &&
                    widget.notifier.selectedAnswer != "") {
                  widget.notifier.checkAnswer();
                }
              },
    );
  }
}
