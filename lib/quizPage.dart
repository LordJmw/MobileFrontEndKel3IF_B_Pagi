import 'package:flutter/material.dart';
import 'package:project_kel2_mfe/homeContent.dart';
import 'package:project_kel2_mfe/homePage.dart';
import 'package:project_kel2_mfe/models/quizQuestion.dart';

class QuizPage extends StatefulWidget {
  final QuizStage quizStage;
  const QuizPage({super.key, required this.quizStage});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Widget> listQuiz;
  late int page;
  double progress = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listQuiz = widget.quizStage.widgets;
    page = widget.quizStage.pageCounter.page.value;

    widget.quizStage.pageCounter.page.addListener(() {
      setState(() {
        if (page == listQuiz.length - 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          );
        } else {
          page = widget.quizStage.pageCounter.page.value;
        }
      });
    });

    widget.quizStage.pageCounter.page.addListener(() {
      setState(() {
        if (widget.quizStage.pageCounter.isCompleted.value) {
          progress += .2;
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
          value: progress,
          minHeight: 18,
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(28, 176, 246, 1),
          backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        ),
      ),
      body: listQuiz[page],
    );
  }
}
