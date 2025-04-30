import 'package:flutter/material.dart';

class MatchingQuestion extends StatefulWidget {
  const MatchingQuestion({super.key});

  @override
  State<MatchingQuestion> createState() => _MatchingQuestionState();
}

class _MatchingQuestionState extends State<MatchingQuestion> {
  final Map<String, String> sampleQuestion = {
    "kucing": "cat",
    "sedikit": "a little",
    "berangin": "windy",
    "sweter": "sweater",
    "mendung": "cloudy",
  };

  List<String> shuffledQuestion = [];
  List<String> shuffledAnswer = [];
  Set<String> completedQuestion = {};
  Set<String> correctSet = {};
  Set<String> checkedSet = {};
  bool tapState = true;
  String selectedQuestion = "";
  String selectedAnswer = "";

  @override
  void initState() {
    super.initState();
    shuffledQuestion = sampleQuestion.keys.toList()..shuffle();
    shuffledAnswer = sampleQuestion.values.toList()..shuffle();
  }

  void checkAnswer() {
    bool isCorrect = sampleQuestion[selectedQuestion] == selectedAnswer;

    setState(() {
      if (isCorrect) {
        correctSet.add(selectedQuestion);
        correctSet.add(selectedAnswer);
      }
      checkedSet.add(selectedQuestion);
      checkedSet.add(selectedAnswer);
      tapState = !tapState;
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        correctSet = {};
        checkedSet = {};
        tapState = !tapState;

        if (isCorrect) {
          completedQuestion.add(selectedQuestion);
          completedQuestion.add(selectedAnswer);
        }
        selectedQuestion = "";
        selectedAnswer = "";

        if (completedQuestion.length == sampleQuestion.length * 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color.fromRGBO(221, 243, 254, 1),
              duration: Duration(days: 1),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(28, 176, 246, 1),
                        foregroundColor: Colors.white,
                        radius: 15,
                        child: Icon(Icons.check_rounded, size: 20),
                      ),
                      title: Text(
                        "Hebat!",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(28, 176, 246, 1),
                          fontFamily: "Jellee",
                        ),
                      ),
                    ),
                  ),
                  // CheckButton(state: true),
                ],
              ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.clear, size: 50, color: Colors.grey[400]),
        title: LinearProgressIndicator(
          value: 0.5,
          minHeight: 18,
          borderRadius: BorderRadius.circular(100),
          color: Colors.orange[500],
          backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        ),
      ),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      for (var i = 0; i < sampleQuestion.length; i++)
                        Builder(
                          builder: (context) {
                            bool isSelected =
                                selectedQuestion == shuffledQuestion[i];
                            bool isDisabled = completedQuestion.contains(
                              shuffledQuestion[i],
                            );
                            bool isCorrect = correctSet.contains(
                              shuffledQuestion[i],
                            );
                            bool isChecked = checkedSet.contains(
                              shuffledQuestion[i],
                            );

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: SizedBox(
                                width: 210,
                                child: ListTile(
                                  contentPadding: EdgeInsets.fromLTRB(
                                    8,
                                    10,
                                    8,
                                    10,
                                  ),
                                  trailing: Radio<String>(
                                    value: shuffledQuestion[i],
                                    groupValue: selectedQuestion,
                                    fillColor: WidgetStateColor.resolveWith((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                            WidgetState.selected,
                                          ) &&
                                          !completedQuestion.contains(
                                            shuffledQuestion[i],
                                          )) {
                                        if (!isChecked) {
                                          return Color.fromRGBO(
                                            28,
                                            176,
                                            246,
                                            1,
                                          );
                                        } else {
                                          if (isCorrect) {
                                            return Color.fromRGBO(
                                              165,
                                              237,
                                              110,
                                              1,
                                            );
                                            // return Color.fromRGBO(215, 255, 184, 1)
                                            // return Color.fromRGBO(90, 169, 4, 1)
                                          } else {
                                            return Color.fromRGBO(
                                              255,
                                              178,
                                              178,
                                              1,
                                            );
                                            // return Color.fromRGBO(255, 223, 224, 1);
                                            // return Color.fromRGBO(234, 43, 43, 1);
                                          }
                                        }
                                      }
                                      return Color.fromRGBO(229, 229, 229, 1);
                                    }),
                                    onChanged:
                                        isDisabled || !tapState
                                            ? null
                                            : (value) {
                                              setState(() {
                                                selectedQuestion = value!;
                                                if (selectedQuestion != "" &&
                                                    selectedAnswer != "") {
                                                  checkAnswer();
                                                }
                                              });
                                            },
                                  ),
                                  enabled: !isDisabled,
                                  selected: isSelected,
                                  selectedTileColor:
                                      isChecked
                                          ? isCorrect
                                              ? Color.fromRGBO(215, 255, 184, 1)
                                              : Color.fromRGBO(255, 223, 224, 1)
                                          : Color.fromRGBO(221, 243, 254, 1),
                                  title: Text(
                                    shuffledQuestion[i],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      // fontWeight: FontWeight.w600,
                                      color:
                                          isDisabled
                                              ? Color.fromRGBO(
                                                229,
                                                229,
                                                229,
                                                .8,
                                              )
                                              : isChecked
                                              ? isCorrect
                                                  ? Color.fromRGBO(
                                                    90,
                                                    169,
                                                    4,
                                                    1,
                                                  )
                                                  : Color.fromRGBO(
                                                    234,
                                                    43,
                                                    43,
                                                    1,
                                                  )
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
                                                      ? Color.fromRGBO(
                                                        165,
                                                        237,
                                                        110,
                                                        1,
                                                      )
                                                      : Color.fromRGBO(
                                                        255,
                                                        178,
                                                        178,
                                                        1,
                                                      )
                                                  : Color.fromRGBO(
                                                    28,
                                                    176,
                                                    246,
                                                    1,
                                                  )
                                              : Color.fromRGBO(
                                                229,
                                                229,
                                                229,
                                                1,
                                              ),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onTap: () {
                                    !tapState
                                        ? null
                                        : setState(() {
                                          selectedQuestion =
                                              shuffledQuestion[i];
                                          if (selectedQuestion != "" &&
                                              selectedAnswer != "") {
                                            checkAnswer();
                                          }
                                        });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),

                  Column(
                    children: [
                      for (var i = 0; i < sampleQuestion.length; i++)
                        Builder(
                          builder: (context) {
                            bool isSelected =
                                selectedAnswer == shuffledAnswer[i];
                            bool isDisabled = completedQuestion.contains(
                              shuffledAnswer[i],
                            );
                            bool isCorrect = correctSet.contains(
                              shuffledAnswer[i],
                            );
                            bool isChecked = checkedSet.contains(
                              shuffledAnswer[i],
                            );

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: SizedBox(
                                width: 210,
                                child: ListTile(
                                  contentPadding: EdgeInsets.fromLTRB(
                                    8,
                                    10,
                                    8,
                                    10,
                                  ),
                                  leading: Radio<String>(
                                    value: shuffledAnswer[i],
                                    groupValue: selectedAnswer,
                                    fillColor: WidgetStateColor.resolveWith((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                            WidgetState.selected,
                                          ) &&
                                          !completedQuestion.contains(
                                            shuffledAnswer[i],
                                          )) {
                                        if (!isChecked) {
                                          return Color.fromRGBO(
                                            28,
                                            176,
                                            246,
                                            1,
                                          );
                                        } else {
                                          if (isCorrect) {
                                            return Color.fromRGBO(
                                              165,
                                              237,
                                              110,
                                              1,
                                            );
                                          } else {
                                            return Color.fromRGBO(
                                              255,
                                              178,
                                              178,
                                              1,
                                            );
                                          }
                                        }
                                      }
                                      return Color.fromRGBO(229, 229, 229, 1);
                                    }),
                                    onChanged:
                                        isDisabled || !tapState
                                            ? null
                                            : (value) {
                                              setState(() {
                                                selectedAnswer = value!;
                                                if (selectedQuestion != "" &&
                                                    selectedAnswer != "") {
                                                  checkAnswer();
                                                }
                                              });
                                            },
                                  ),
                                  enabled: !isDisabled,
                                  selected: isSelected,
                                  selectedTileColor:
                                      isChecked
                                          ? isCorrect
                                              ? Color.fromRGBO(215, 255, 184, 1)
                                              : Color.fromRGBO(255, 223, 224, 1)
                                          : Color.fromRGBO(221, 243, 254, 1),
                                  title: Text(
                                    shuffledAnswer[i],
                                    style: TextStyle(
                                      color:
                                          isDisabled
                                              ? Color.fromRGBO(
                                                229,
                                                229,
                                                229,
                                                .8,
                                              )
                                              : isChecked
                                              ? isCorrect
                                                  ? Color.fromRGBO(
                                                    90,
                                                    169,
                                                    4,
                                                    1,
                                                  )
                                                  : Color.fromRGBO(
                                                    234,
                                                    43,
                                                    43,
                                                    1,
                                                  )
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
                                                      ? Color.fromRGBO(
                                                        165,
                                                        237,
                                                        110,
                                                        1,
                                                      )
                                                      : Color.fromRGBO(
                                                        255,
                                                        178,
                                                        178,
                                                        1,
                                                      )
                                                  : Color.fromRGBO(
                                                    28,
                                                    176,
                                                    246,
                                                    1,
                                                  )
                                              : Color.fromRGBO(
                                                229,
                                                229,
                                                229,
                                                1,
                                              ),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onTap: () {
                                    !tapState
                                        ? null
                                        : setState(() {
                                          selectedAnswer = shuffledAnswer[i];
                                          if (selectedQuestion != "" &&
                                              selectedAnswer != "") {
                                            checkAnswer();
                                          }
                                        });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
                child: ToggleDropShadow(
                  offset: 6,
                  dropShadowColor: Color.fromRGBO(17, 117, 163, 1),
                  height: 60,
                  child: (notifier) => CheckButton(toggleNotifier: notifier),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
  final ValueNotifier<bool> toggleNotifier;
  const CheckButton({super.key, required this.toggleNotifier});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        toggleNotifier.value = !toggleNotifier.value;

        Future.delayed(Duration(milliseconds: 100), () {
          toggleNotifier.value = !toggleNotifier.value;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: Color.fromRGBO(28, 176, 246, 1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 18, 0, 18),

        child: Center(
          child: Text(
            "PERIKSA",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Jellee",
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class ToggleDropShadow extends StatefulWidget {
  final double offset;
  final Color dropShadowColor;
  final double height;
  final Widget Function(ValueNotifier<bool> toggleNotifier) child;

  const ToggleDropShadow({
    super.key,
    required this.offset,
    required this.dropShadowColor,
    required this.height,
    required this.child,
  });

  @override
  State<ToggleDropShadow> createState() => _ToggleDropShadowState();
}

class _ToggleDropShadowState extends State<ToggleDropShadow> {
  final ValueNotifier<bool> toggleNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Expanded(
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.dropShadowColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        ValueListenableBuilder(
          valueListenable: toggleNotifier,
          builder:
              (context, pressed, _) => Positioned(
                bottom: !pressed ? widget.offset : 0,
                left: 0,
                right: 0,
                child: widget.child(toggleNotifier),
              ),
        ),

        SizedBox(height: widget.height + widget.offset + 2),
      ],
    );
  }
}
