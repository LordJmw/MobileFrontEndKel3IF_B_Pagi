import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_kel2_mfe/Profile.dart';
import 'package:project_kel2_mfe/homePage.dart';
import 'package:project_kel2_mfe/zbhal.dart';

class MainDisplay extends StatefulWidget {
  const MainDisplay({super.key});

  @override
  State<MainDisplay> createState() => _MainDisplayState();
}

class _MainDisplayState extends State<MainDisplay> {
  int selectedIndex = 0;
  final List<Widget> displayMenu = [
    HomePage(),
    Golda(),
    HomePage(),
    Profile_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: displayMenu[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedFontSize: 14,
        unselectedItemColor: Color.fromRGBO(28, 176, 246, 1),
        selectedItemColor: Color.fromRGBO(28, 176, 246, 1),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimney, size: 18),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookAtlas, size: 18),
            label: "Vocabulary",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookJournalWhills, size: 18),
            label: "Grammar",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userTie, size: 18),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
