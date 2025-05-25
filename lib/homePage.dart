import 'package:flutter/material.dart';
import 'package:tugas2/Grammar.dart';
import 'package:tugas2/Profile.dart';
import 'package:tugas2/homeContent.dart';
import 'package:tugas2/models/quizQuestion.dart';
import 'package:tugas2/quizPage.dart';
import 'package:tugas2/zbhal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late QuizUnit quizUnit;
  late List<Widget> views;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quizUnit = QuizUnit(
      title: "Halo Nama Saya...",
      category: ["Simple Present", "Simple Past", "Self-Introduced"],
    );

    views = [
      HomeContent(),
      Golda(),
      QuizPage(quizStage: quizUnit.stages[0]),
      GrammarScreen(),
      Profile_Page(),
    ];
  }

  Widget currentView = HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        title: Text("Engliboo", style: TextStyle(color: Colors.grey)),
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      ),
      body: currentView,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            currentView = views[index];
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined, color: Colors.red),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Colors.purple),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields, color: Colors.red),
            label: 'Vocabulary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
