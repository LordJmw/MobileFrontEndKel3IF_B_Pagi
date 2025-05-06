import 'package:flutter/material.dart';

class ArrangingWords extends StatefulWidget {
  final List<String> words;
  final String answers;
  final String question;
  const ArrangingWords({
    super.key,
    required this.question,
    required this.words,
    required this.answers,
  });

  @override
  State<ArrangingWords> createState() => _ArrangingWordsState();
}

class _ArrangingWordsState extends State<ArrangingWords> {
  List<String> selectedWords = [];
  List<String> AvailableWords = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AvailableWords = List.from(widget.words);
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // bool smallScreen = screenWidth < 600;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menyusun kalimat"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 15),
              child: Text(
                "Terjemahkan kata kata dibawah",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset("assets/icons8-john-wick-64.png"),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(widget.question),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),

                    DragTarget<String>(
                      onWillAccept: (data) => true,

                      onAccept: (droppedWord) {
                        setState(() {
                          if (!selectedWords.contains(droppedWord)) {
                            selectedWords.add(droppedWord);
                            AvailableWords.remove(droppedWord);
                          }
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Wrap(
                            spacing: 5,

                            //membuat suatu list dari beberapa widget, iterasi melalui semua kata dalam list selectedWords
                            children: List.generate(selectedWords.length, (
                              index,
                            ) {
                              String word = selectedWords[index];

                              //pakai draggable lagi supaya meski dalam container masih bisa di drag
                              return Draggable<String>(
                                data: word,
                                feedback: Material(
                                  color: Colors.transparent,
                                  child: Chip(label: Text(word)),
                                ),
                                childWhenDragging: Opacity(
                                  opacity: 0.5,
                                  child: Chip(label: Text(word)),
                                ),
                                child: DragTarget<String>(
                                  onWillAccept: (data) => true,
                                  onAccept: (droppedWord) {
                                    setState(() {
                                      //index di dragtarget != index dari list.generate
                                      //saya makan nasi
                                      //kalau yg di drag nasi, index di draggable 2
                                      //di drop di posisi nasi, maka dragtarget run dengan index target(yang di drop) = 0, bukan 2 dari index
                                      //list.generate
                                      //maka insert nasi di index 0
                                      //jadi index di dragtarget adalah index target
                                      selectedWords.remove(droppedWord);
                                      selectedWords.insert(index, droppedWord);
                                    });
                                  },
                                  builder: (
                                    context,
                                    candidateData,
                                    rejectedData,
                                  ) {
                                    return Chip(
                                      label: Text(word),
                                      onDeleted: () {
                                        setState(() {
                                          selectedWords.remove(word);
                                          AvailableWords.add(word);
                                        });
                                      },
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    //agar bisa drag word
                    Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      children:
                          AvailableWords.map((word) {
                            return Draggable<String>(
                              data: word,

                              //ketika di drag, kotak kotak yang berisi word bagaimana ui nya
                              feedback: Material(
                                color: Colors.transparent,
                                child: Chip(
                                  label: Text(
                                    word,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                              ),

                              //ui dari kotak di posisi awal ketika kotak ini di drag
                              childWhenDragging: Opacity(
                                opacity: 0.5,
                                child: Chip(
                                  label: Text(
                                    word,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              //ui normal dari masing masing kotak
                              child: Chip(
                                label: Text(
                                  word,
                                  style: TextStyle(fontSize: 15),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String UserAnswer = selectedWords.join(" ");
                        if (UserAnswer.toLowerCase() ==
                            widget.answers.toLowerCase()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Jawaban Anda Benar"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                        if (UserAnswer.toLowerCase() !=
                            widget.answers.toLowerCase()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Jawaban Anda Salah"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      child: Text("Check"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
