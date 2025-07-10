import 'package:flutter/widgets.dart';
import 'package:tugas2/arranging_words.dart';
import 'package:tugas2/matching.dart';
import 'package:tugas2/textfield.dart';

/// Question Type harus diantara tiga tipe ini
enum QuestionType { textfield, arrangingWords, matching }

/// Model for dynamic question data
class QuestionData {
  final QuestionType type;
  final Map<String, dynamic> data;

  QuestionData({required this.type, required this.data});
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

class QuizUnit {
  final String title;
  final List<String> category;
  final List<QuizStage> stages;
  final ValueNotifier<double> progress = ValueNotifier(0);

  QuizUnit({
    required this.title,
    required this.category,
    required List<QuestionData> questions,
  }) : stages = [
         QuizStage(
           widgetBuilders:
               questions.map((question) {
                 return (pageCounter) => _buildWidget(question, pageCounter);
               }).toList(),
         ),
       ];

  static Widget _buildWidget(QuestionData question, PageCounter pageCounter) {
    switch (question.type) {
      case QuestionType.textfield:
        return Textfield(
          image: Image.network(question.data['image'], width: 200, height: 200),
          label: question.data['label'],
          correctAnswer: question.data['correctAnswer'],
          pageCounter: pageCounter,
        );
      case QuestionType.arrangingWords:
        return ArrangingWords(
          question: question.data['question'],
          words: List<String>.from(question.data['words']),
          answers: question.data['answers'],
          pageCounter: pageCounter,
        );
      case QuestionType.matching:
        return MatchingQuestion(
          pairs: Map<String, String>.from(question.data['pairs']),
          pageCounter: pageCounter,
        );
    }
  }
}

// import 'package:flutter/widgets.dart';
// import 'package:tugas2/arranging_words.dart';
// import 'package:tugas2/matching.dart';
// import 'package:tugas2/textfield.dart';

// class QuizUnit {
//   final String title;
//   final List<String> category;
//   final List<QuizStage> stages;
//   final ValueNotifier<double> progress = ValueNotifier(0);

//   QuizUnit({required this.title, required this.category})
//     : stages = [
//         QuizStage(
//           widgetBuilders: [
//             (pageCounter) => Textfield(
//               image: Image.network(
//                 'https://png.pngtree.com/png-clipart/20190925/original/pngtree-rabbit_cartoon-png-image_4992696.jpg',
//                 width: 200,
//                 height: 200,
//               ),
//               label: "Kelinci",
//               correctAnswer: "rabbit",
//               pageCounter: pageCounter,
//             ),
//             (pageCounter) => ArrangingWords(
//               question: "saya suka burger",
//               words: ["I", "You", "like", "soda", "burger", "always"],
//               answers: "i like burger",
//               pageCounter: pageCounter,
//             ),
//             (pageCounter) => MatchingQuestion(
//               pairs: {
//                 "i": "saya",
//                 "you": "kamu",
//                 "like": "suka",
//                 "play": "bermain",
//                 "sunday": "minggu",
//               },
//               pageCounter: pageCounter,
//             ),
//           ],
//         ),
//       ];
// }

// class PageCounter {
//   final ValueNotifier<int> page = ValueNotifier(0);
//   final ValueNotifier<bool> isCompleted = ValueNotifier(false);
//   void nextPage() {
//     page.value += 1;
//     isCompleted.value = !isCompleted.value;
//   }

//   void completed() {
//     isCompleted.value = !isCompleted.value;
//   }
// }

// class QuizStage {
//   final PageCounter pageCounter = PageCounter();
//   final List<Widget Function(PageCounter)> widgetBuilders;

//   QuizStage({required this.widgetBuilders});

//   List<Widget> get widgets =>
//       widgetBuilders.map((builder) => builder(pageCounter)).toList();
// }
