import 'package:flutter/material.dart';

class TileState extends ChangeNotifier {
  final Map<String, String> sampleQuestion = {
    "kucing": "cat",
    "sedikit": "a little",
    "berangin": "windy",
    "sweter": "sweater",
    "mendung": "cloudy",
  };
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
    bool isCorrect = sampleQuestion[selectedQuestion] == selectedAnswer;

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
      }
      selectedQuestion = "";
      selectedAnswer = "";

      // if (completedQuestion.length == sampleQuestion.length * 2) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       backgroundColor: Color.fromRGBO(221, 243, 254, 1),
      //       duration: Duration(days: 1),
      //       content: Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      //             child: ListTile(
      //               contentPadding: EdgeInsets.zero,
      //               leading: CircleAvatar(
      //                 backgroundColor: Color.fromRGBO(28, 176, 246, 1),
      //                 foregroundColor: Colors.white,
      //                 radius: 15,
      //                 child: Icon(Icons.check_rounded, size: 20),
      //               ),
      //               title: Text(
      //                 "Hebat!",
      //                 style: TextStyle(
      //                   fontSize: 22,
      //                   color: Color.fromRGBO(28, 176, 246, 1),
      //                   fontFamily: "Jellee",
      //                 ),
      //               ),
      //             ),
      //           ),
      //           // CheckButton(state: true),
      //         ],
      //       ),
      //     ),
      //   );
      // }
      notifyListeners();
    });
  }
}

class MatchingTiles extends StatefulWidget {
  final TileState notifier;
  final String tileValue;
  final bool isQuestion;
  const MatchingTiles({
    super.key,
    required this.notifier,
    required this.tileValue,
    required this.isQuestion,
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: SizedBox(
        width: 210,
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
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

                    if (widget.notifier.selectedQuestion != "" &&
                        widget.notifier.selectedAnswer != "") {
                      widget.notifier.checkAnswer();
                    }
                  },
        ),
      ),
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
        if (states.contains(WidgetState.selected) && !isDisabled) {
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
                widget.notifier.changeSelected(value, widget.isQuestion);
                if (widget.notifier.selectedQuestion != "" &&
                    widget.notifier.selectedAnswer != "") {
                  widget.notifier.checkAnswer();
                }
              },
    );
  }
}

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
  final TileState notifier = TileState();
  List<String> shuffledQuestion = [];
  List<String> shuffledAnswer = [];

  @override
  void initState() {
    super.initState();
    shuffledQuestion = sampleQuestion.keys.toList()..shuffle();
    shuffledAnswer = sampleQuestion.values.toList()..shuffle();
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

              Column(
                children: [
                  for (int i = 0; i < sampleQuestion.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MatchingTiles(
                          notifier: notifier,
                          tileValue: shuffledQuestion[i],
                          isQuestion: true,
                        ),
                        MatchingTiles(
                          notifier: notifier,
                          tileValue: shuffledAnswer[i],
                          isQuestion: false,
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
