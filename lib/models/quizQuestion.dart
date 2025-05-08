import 'package:flutter/widgets.dart';
import 'package:project_kel2_mfe/arranging_words.dart';
import 'package:project_kel2_mfe/matching.dart';
import 'package:project_kel2_mfe/textfield.dart';

class QuizUnit {
  final String title;
  final List<String> category;
  final int progress = 0;
  final List<QuizStage> stages;

  QuizUnit({required this.title, required this.category})
    : stages = [
        QuizStage(
          widgetBuilders: [
            (pageCounter) => Textfield(
              image: Image.asset(
                'assets/images/kelinci.png',
                width: 200,
                height: 200,
              ),
              label: "Kelinci",
              correctAnswer: "rabbit",
              pageCounter: pageCounter,
            ),
            (pageCounter) => ArrangingWords(
              question: "saya suka kucing",
              words: ["I", "like", "dog", "cat"],
              answers: "i like cat",
              pageCounter: pageCounter,
            ),
            (pageCounter) => MatchingQuestion(
              pairs: {
                "kucing": "cat",
                "sedikit": "a little",
                "berangin": "windy",
                "sweter": "sweater",
                "mendung": "cloudy",
              },
              pageCounter: pageCounter,
            ),
          ],
        ),
      ];
}

class PageCounter {
  final ValueNotifier<int> page = ValueNotifier(0);

  void nextPage() {
    page.value += 1;
  }
}

class QuizStage {
  final PageCounter pageCounter = PageCounter();
  final List<Widget Function(PageCounter)> widgetBuilders;

  QuizStage({required this.widgetBuilders});

  List<Widget> get widgets =>
      widgetBuilders.map((builder) => builder(pageCounter)).toList();
}
