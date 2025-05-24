import 'package:flutter/widgets.dart';
import 'package:tugas2/arranging_words.dart';
import 'package:tugas2/matching.dart';
import 'package:tugas2/textfield.dart';

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
              image: Image.network(
                'https://png.pngtree.com/png-clipart/20190925/original/pngtree-rabbit_cartoon-png-image_4992696.jpg',
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
