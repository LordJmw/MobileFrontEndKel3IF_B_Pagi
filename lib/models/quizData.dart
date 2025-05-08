import 'package:flutter/widgets.dart';
import 'package:project_kel2_mfe/arranging_words.dart';
import 'package:project_kel2_mfe/matching.dart';
import 'package:project_kel2_mfe/textfield.dart';

class QuizUnit {
  final String title;
  final List<String> category;
  final ValueNotifier<double> progress = ValueNotifier(0);
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
            (pageCounter) => ArrangingWords(
              question: "saya suka burger",
              words: ["I", "You", "like", "soda", "burger", "always"],
              answers: "i like burger",
              pageCounter: pageCounter,
            ),
            (pageCounter) => MatchingQuestion(
              pairs: {
                "i": "saya",
                "you": "kamu",
                "like": "suka",
                "play": "bermain",
                "sunday": "minggu",
              },
              pageCounter: pageCounter,
            ),
          ],
        ),
      ];
}

class PageCounter {
  final ValueNotifier<int> page = ValueNotifier(0);
  final ValueNotifier<bool> isCompleted = ValueNotifier(false);

  void nextPage() {
    page.value += 1;
    isCompleted.value = !isCompleted.value;
  }

  void completed() {
    isCompleted.value = !isCompleted.value;
  }
}

class QuizStage {
  final PageCounter pageCounter = PageCounter();
  final List<Widget Function(PageCounter)> widgetBuilders;

  QuizStage({required this.widgetBuilders});

  List<Widget> get widgets =>
      widgetBuilders.map((builder) => builder(pageCounter)).toList();
}
