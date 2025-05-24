import 'package:flutter/material.dart';

class Golda extends StatefulWidget {
  const Golda({super.key});

  @override
  State<Golda> createState() => _GoldaState();
}

class _GoldaState extends State<Golda> {
  String selectedOption = 'Baru dipelajari';

  final List<Map<String, dynamic>> options = [
    {'label': 'Berdasarkan abjad', 'icon': Icons.sort_by_alpha},
    {'label': 'Baru dipelajari', 'icon': Icons.access_time},
  ];

  final List<Map<String, String>> Initialvocabulary = [
    {'en': 'open', 'id': 'buka'},
    {'en': 'apple', 'id': 'apel'},
    {'en': 'animal', 'id': 'hewan'},
    {'en': 'book', 'id': 'buku'},
    {'en': 'brain', 'id': 'otak'},
    {'en': 'chicken', 'id': 'ayam'},
    {'en': 'worm', 'id': 'cacing'},
    {'en': 'table', 'id': 'meja'},
    {'en': 'new', 'id': 'baru'},
    {'en': 'store', 'id': 'toko'},
    {'en': "don't worry", 'id': 'jangan khawatir'},
    {'en': 'snake', 'id': 'ular'},
    {'en': 'three', 'id': 'tiga'},
    {'en': 'smart', 'id': 'pintar'},
  ];
  late List<Map<String, String>> vocabulary;

  @override
  void initState() {
    super.initState();
    // Initialize vocabulary as a copy of the initial list
    vocabulary = List<Map<String, String>>.from(Initialvocabulary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Engliboo",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: Colors.lightBlue,
            //       ),
            //     ),
            //     Icon(Icons.search, color: Colors.lightBlue),
            //   ],
            // ),
            SizedBox(height: 10),
            Text(
              "Ayo, Latih kata - kata bahasa Inggrismu!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 8),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(20),
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: "Jellee",
                          fontWeight: FontWeight.w700,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("MULAI LATIHAN +20 XP"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey.shade400, height: 1),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("130 kata", style: TextStyle(fontFamily: "Jellee")),
                SizedBox(
                  width: 180,
                  child: Container(
                    constraints: BoxConstraints(minWidth: 150),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: DropdownButton<String>(
                      underline: Container(),
                      isExpanded: true,
                      value: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          if (value == 'Berdasarkan abjad') {
                            vocabulary.sort(
                              (a, b) => a['en']!.compareTo(b['en']!),
                            );
                          } else if (value == "Baru dipelajari") {
                            vocabulary = List<Map<String, String>>.from(
                              Initialvocabulary,
                            );
                          }
                        });
                      },
                      dropdownColor: Colors.grey.shade100.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(12),
                      elevation: 6,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      icon: Icon(Icons.arrow_drop_down),

                      items:
                          options.map((option) {
                            bool isSelected = option['label'] == selectedOption;
                            return DropdownMenuItem<String>(
                              value: option['label'],
                              child: Container(
                                decoration:
                                    isSelected
                                        ? BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        )
                                        : null,
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Icon(option['icon'], color: Colors.black),
                                    SizedBox(width: 8),
                                    Expanded(child: Text(option['label'])),
                                    if (isSelected)
                                      Icon(
                                        Icons.check,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: vocabulary.length,
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemBuilder: (context, index) {
                  final word = vocabulary[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        word['en']!,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        word['id']!,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      dense: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
