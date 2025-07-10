import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'dart:math';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  int _radioValue = 0;
  String name = "John Rick";
  TextEditingController newName = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 600;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // constraints: BoxConstraints(
            //   maxWidth: isLargeScreen ? 600 : screenWidth * 0.9,
            // ),
            color: Colors.white,
            width: min(MediaQuery.of(context).size.width * 0.9, 500),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                icon: Icon(Icons.edit),
                                content: SingleChildScrollView(
                                  // height: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text("Edit Your Account Name"),
                                      ),
                                      TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: "Masukkan Nama Baru Anda",
                                          hintStyle: TextStyle(fontSize: 12),
                                        ),
                                        controller: newName,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              47,
                                              90,
                                              125,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            name = newName.text;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            47,
                                            90,
                                            125,
                                          ),
                                        ),
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        label: Text("Edit Name"),
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https://img.icons8.com/?size=100&id=wNKfod2b7pUn&format=png&color=000000",
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: min(MediaQuery.of(context).size.width * 0.65, 300),
                    height: 10,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      value: 0.3,
                      backgroundColor: const Color.fromARGB(255, 192, 192, 192),
                      valueColor: AlwaysStoppedAnimation(
                        const Color.fromARGB(255, 51, 155, 240),
                      ),
                    ),
                  ),
                  Text("Level 2", style: TextStyle(fontSize: 15)),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ringkasan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Column(
                        children: [
                          //baris 1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        174,
                                        173,
                                        173,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: TextButton.icon(
                                                onPressed: null,
                                                label: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Beginner",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text("Tingkat Bahasa"),
                                                  ],
                                                ),
                                                icon: Icon(
                                                  Icons.signal_cellular_alt,
                                                  color: Color.fromARGB(
                                                    255,
                                                    51,
                                                    155,
                                                    240,
                                                  ),
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        174,
                                        173,
                                        173,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: TextButton.icon(
                                                onPressed: null,
                                                label: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Mati",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text("Alarm Pengingat"),
                                                  ],
                                                ),
                                                icon: Icon(
                                                  Icons.notifications,
                                                  color: const Color.fromARGB(
                                                    255,
                                                    227,
                                                    204,
                                                    4,
                                                  ),
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          //baris 2
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        174,
                                        173,
                                        173,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: TextButton.icon(
                                                onPressed: null,
                                                label: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "1220",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text("Total XP"),
                                                  ],
                                                ),
                                                icon: Icon(
                                                  Icons.flash_on,
                                                  color: const Color.fromARGB(
                                                    255,
                                                    227,
                                                    204,
                                                    4,
                                                  ),
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        174,
                                        173,
                                        173,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: TextButton.icon(
                                                onPressed: null,
                                                label: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "30",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text("Runtutan Hari"),
                                                  ],
                                                ),
                                                icon: Icon(
                                                  Icons.local_fire_department,
                                                  color: Colors.orangeAccent,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Catatan Rekor",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        },
                      ),
                      Text("Semua"),
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        },
                      ),
                      Text("30 Hari Terakhir"),
                    ],
                  ),

                  SizedBox(height: 15),

                  Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    174,
                                    173,
                                    173,
                                  ),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.bullseye,
                                      size: 60,
                                      color: const Color.fromARGB(
                                        255,
                                        146,
                                        212,
                                        70,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text("Pelajaran"),
                                    Text("Sempurna"),
                                    Text(
                                      "17 Agu 2024",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                          255,
                                          174,
                                          173,
                                          173,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    174,
                                    173,
                                    173,
                                  ),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.flash_on,
                                      color: const Color.fromARGB(
                                        255,
                                        227,
                                        204,
                                        4,
                                      ),
                                      size: 60,
                                    ),
                                    SizedBox(height: 10),
                                    Text("XP Terbanyak"),
                                    Text("Sempurna"),
                                    Text(
                                      "20 Des 2024",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                          255,
                                          174,
                                          173,
                                          173,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    174,
                                    173,
                                    173,
                                  ),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.local_fire_department,
                                      color: Colors.orangeAccent,
                                      size: 60,
                                    ),
                                    SizedBox(height: 10),
                                    Text("Rekor Runtunan"),
                                    Text("Sempurna"),
                                    Text(
                                      "11 Jan 2025",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                          255,
                                          174,
                                          173,
                                          173,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
