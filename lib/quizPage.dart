import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas2/HomeProgressProvider.dart';
import 'package:tugas2/homeContent.dart';
import 'package:tugas2/homePage.dart';
import 'package:tugas2/models/quizQuestion.dart';

class QuizPage extends StatefulWidget {
  final QuizStage quizStage;
  final int quizIndex;
  final bool shouldMarkCompleted;
  const QuizPage({
    super.key,
    required this.quizStage,
    required this.quizIndex,
    this.shouldMarkCompleted = true,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Widget> listQuiz;
  late int page;
  double progress = 0;
  bool _isDisposed =
      false; //dipakai supaya setState ga ke trigger di widget lama yang ga kepakai
  //kalau ga dispose nanti bisa error,"Tried to listen to a value exposed with provider, from outside of the widget tree.

  @override
  void initState() {
    super.initState();
    listQuiz = widget.quizStage.widgets;
    page = widget.quizStage.pageCounter.page.value;

    widget.quizStage.pageCounter.page.addListener(_handlePageChange);
    widget.quizStage.pageCounter.isCompleted.addListener(_handleCompletion);
  }

  void _handlePageChange() {
    if (_isDisposed) return;

    if (page == listQuiz.length - 1) {
      if (widget.shouldMarkCompleted && widget.quizIndex != null) {
        final provider = Provider.of<ProgressProvider>(context, listen: false);
        provider.updateProgress(widget.quizIndex);
      }

      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      if (mounted)
        setState(() {
          page = widget.quizStage.pageCounter.page.value;
        });
    }
  }

  void _handleCompletion() {
    if (_isDisposed || !mounted) return;

    setState(() {
      progress =
          (widget.quizStage.pageCounter.page.value + 1) / listQuiz.length;
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    widget.quizStage.pageCounter.page.removeListener(_handlePageChange);
    widget.quizStage.pageCounter.isCompleted.removeListener(_handleCompletion);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.clear, size: 30, color: Colors.grey[400]),
        ),
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
