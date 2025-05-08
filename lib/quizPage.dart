import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listQuiz = widget.quizStage.widgets;
    page = widget.quizStage.pageCounter.page.value;

    widget.quizStage.pageCounter.page.addListener(() {
      setState(() {
        if (page == listQuiz.length - 1) {
          print(1);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          );
        } else {
          page = widget.quizStage.pageCounter.page.value;
          print(page);
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
      body: listQuiz[page],
    );
  }
}
