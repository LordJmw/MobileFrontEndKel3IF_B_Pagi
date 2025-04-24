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
  Set<String> completedAnswer = {};
  String selectedQuestion = "";
  String selectedAnswer = "";

  @override
  void initState() {
    super.initState();
    shuffledQuestion = sampleQuestion.keys.toList()..shuffle();
    shuffledAnswer = sampleQuestion.values.toList()..shuffle();
  }

  void checkAnswer() {
    if (sampleQuestion[selectedQuestion] == selectedAnswer) {
      completedQuestion.add(selectedQuestion);
      completedAnswer.add(selectedAnswer);
    }

    setState(() {
      selectedQuestion = "";
      selectedAnswer = "";
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
        padding: const EdgeInsets.all(14.0),
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

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: SizedBox(
                                width: 210,
                                child: ListTile(
                                  contentPadding: EdgeInsets.fromLTRB(
                                    8,
                                    6,
                                    8,
                                    6,
                                  ),
                                  trailing: Radio<String>(
                                    value: shuffledQuestion[i],
                                    groupValue: selectedQuestion,
                                    fillColor: WidgetStateColor.resolveWith((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
                                        return Color.fromRGBO(28, 176, 246, 1);
                                      }
                                      return Color.fromRGBO(229, 229, 229, 1);
                                    }),
                                    onChanged:
                                        isDisabled
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
                                  selectedTileColor: Color.fromRGBO(
                                    221,
                                    243,
                                    254,
                                    1,
                                  ),
                                  selectedColor: Color.fromRGBO(
                                    28,
                                    176,
                                    246,
                                    1,
                                  ),
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
                                              : Colors.black,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color:
                                          isSelected
                                              ? Color.fromRGBO(28, 176, 246, 1)
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
                                    setState(() {
                                      selectedQuestion = shuffledQuestion[i];
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
                            bool isDisabled = completedAnswer.contains(
                              shuffledAnswer[i],
                            );

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: SizedBox(
                                width: 210,
                                child: ListTile(
                                  contentPadding: EdgeInsets.fromLTRB(
                                    8,
                                    6,
                                    8,
                                    6,
                                  ),
                                  leading: Radio<String>(
                                    value: shuffledAnswer[i],
                                    groupValue: selectedAnswer,
                                    fillColor: WidgetStateColor.resolveWith((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
                                        return Color.fromRGBO(28, 176, 246, 1);
                                      }
                                      return Color.fromRGBO(229, 229, 229, 1);
                                    }),
                                    onChanged:
                                        isDisabled
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
                                  selectedTileColor: Color.fromRGBO(
                                    221,
                                    243,
                                    254,
                                    1,
                                  ),
                                  selectedColor: Color.fromRGBO(
                                    28,
                                    176,
                                    246,
                                    1,
                                  ),
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
                                              : Colors.black,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color:
                                          isSelected
                                              ? Color.fromRGBO(28, 176, 246, 1)
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
                                    setState(() {
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

              Container(
                // color: Color.fromRGBO(87, 204, 2, 1),
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(87, 204, 2, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(88, 167, 0, 1),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "PERIKSA",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Jellee",
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              // TextButton(onPressed: (){}, style: ButtonStyle(backgroundColor: ), child: Text("PERIKSA"))
            ],
          ),
        ),
      ),
    );
  }
}
