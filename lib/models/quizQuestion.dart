import 'package:flutter/widgets.dart';
import 'package:utsfrontend/arranging_words.dart';
import 'package:utsfrontend/matching.dart';
import 'package:utsfrontend/textfield.dart';

class QuizUnit {
  final String title;
  final List<String> category;
  final List<QuizStage> stages;
  final ValueNotifier<double> progress = ValueNotifier(0);

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
