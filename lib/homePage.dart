import 'package:flutter/material.dart';
import 'package:tugas2/Grammar.dart';
import 'package:tugas2/Profile.dart';
import 'package:tugas2/aboutPage.dart';
import 'package:tugas2/homeContent.dart';
import 'package:tugas2/models/quizQuestion.dart';
import 'package:tugas2/quizPage.dart';
import 'package:tugas2/schedule.dart';
import 'package:tugas2/scheduleTab.dart';
import 'package:tugas2/zbhal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<Widget> views;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   views = [
  //     HomeContent(),
  //     Golda(),
  //     QuizPage(quizStage: quizUnit.stages[0]),
  //     GrammarScreen(),
  //     Profile_Page(),
  //   ];
  // }

  QuizUnit quizUnit = QuizUnit(
    title: "Halo Nama Saya...",
    category: ["Simple Present", "Simple Past", "Self-Introduced"],
  );

  Map<String, Widget> pages = {
    "home": HomeContent(),
    "vocabulary": Golda(),
    "grammar": GrammarScreen(),
    "profile": Profile_Page(),
    "Jadwal Belajar Saya": ScheduleTab(),
    "About Us": AboutPage(),
  };
  ValueNotifier<String> selectedPage = ValueNotifier("home");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        title: ListenableBuilder(
          listenable: selectedPage,
          builder:
              (context, child) => Text(
                "${selectedPage.value[0].toUpperCase()}${selectedPage.value.substring(1)}",
              ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(28, 176, 246, 1),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          ListenableBuilder(
            listenable: selectedPage,
            builder: (context, child) {
              if (selectedPage.value == "home") {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "Level 1",
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: 20,
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                              backgroundColor: Colors.white,
                              value: 0.2,
                              valueColor: AlwaysStoppedAnimation(
                                const Color.fromARGB(255, 29, 228, 29),
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: null,
                            label: Text(
                              "5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (selectedPage.value == "vocabulary") {
                return Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Icon(Icons.search),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        width: 350,
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                "Engliboo",
                style: TextStyle(
                  color: Color.fromRGBO(28, 176, 246, 1),
                  fontFamily: "Jellee",
                  fontSize: 24,
                ),
              ),
            ),
            Divider(),
            ListTileDrawer(
              selectedPage: selectedPage,
              label: "home",
              icon: Icons.home,
            ),
            ListTileDrawer(
              selectedPage: selectedPage,
              label: "vocabulary",
              icon: Icons.book,
            ),
            ListTileDrawer(
              selectedPage: selectedPage,
              label: "grammar",
              icon: Icons.text_fields,
            ),
            ListTileDrawer(
              selectedPage: selectedPage,
              label: "Jadwal Belajar Saya",
              icon: Icons.date_range,
            ),
            ListTileDrawer(
              selectedPage: selectedPage,
              label: "profile",
              icon: Icons.person,
            ),
            ListTileDrawer(
              selectedPage: selectedPage,
              label: "About Us",
              icon: Icons.info,
            ),
          ],
        ),
      ),
      body: ListenableBuilder(
        listenable: selectedPage,
        builder: (context, child) => pages[selectedPage.value]!,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   onTap: (index) {
      //     setState(() {
      //       currentView = views[index];
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.book_outlined, color: Colors.red),
      //       label: 'Lessons',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu_book, color: Colors.purple),
      //       label: 'Dictionary',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.text_fields, color: Colors.red),
      //       label: 'Vocabulary',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person, color: Colors.blue),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}

class ListTileDrawer extends StatefulWidget {
  const ListTileDrawer({
    super.key,
    required this.selectedPage,
    required this.label,
    required this.icon,
  });

  final ValueNotifier<String> selectedPage;
  final String label;
  final IconData icon;

  @override
  State<ListTileDrawer> createState() => _ListTileDrawerState();
}

class _ListTileDrawerState extends State<ListTileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
      child: ListTile(
        leading: Icon(widget.icon),
        title: Text(
          "${widget.label[0].toUpperCase()}${widget.label.substring(1)}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        selected: widget.selectedPage.value == widget.label,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        selectedColor: Color.fromRGBO(28, 176, 246, 1),
        selectedTileColor: Color.fromRGBO(221, 243, 254, 1),
        onTap: () {
          setState(() {
            Navigator.pop(context);
            widget.selectedPage.value = widget.label;
          });
        },
      ),
    );
  }
}
