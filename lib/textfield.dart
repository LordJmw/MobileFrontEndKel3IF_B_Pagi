import 'package:flutter/material.dart';
import 'package:tugas2/components/check_button.dart';
import 'package:tugas2/components/press_effect.dart';
import 'package:tugas2/models/quizQuestion.dart';

class Textfield extends StatefulWidget {
  final Image image;
  final String label;
  final String correctAnswer;
  final PageCounter pageCounter;
  const Textfield({
    super.key,
    required this.image,
    required this.label,
    required this.correctAnswer,
    required this.pageCounter,
  });

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  final TextEditingController answer = TextEditingController();
  bool isActive = false;
  String buttonText = "PERIKSA";

  void checkAnswer() {
    setState(() {
      if (widget.correctAnswer == answer.text.toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Jawaban Anda Benar"),
            backgroundColor: const Color.fromARGB(255, 2, 201, 9),
            duration: Duration(seconds: 3),
          ),
        );
        widget.pageCounter.completed();
        Future.delayed(Duration(seconds: 4), () {
          widget.pageCounter.nextPage();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Jawaban Anda Salah"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        Future.delayed(Duration(seconds: 4), () {
          setState(() {
            buttonText = "PERIKSA";
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Terjemahkan kata ini",
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: "Jellee",
                    color: Color.fromRGBO(75, 75, 75, 1),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Color(0xFFE5E5E5)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [widget.image, Text(widget.label)]),
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: "Ketik dalam Bahasa Inggris",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(247, 247, 247, 1),
                ),
                controller: answer,
                onChanged: (value) {
                  setState(() {
                    isActive = true;
                  });
                },
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: PressEffect(
                  offset: 6,
                  child:
                      (toggle) => CheckButton(
                        pressEffectController: toggle,
                        buttonState: isActive,
                        action: checkAnswer,
                        label: buttonText,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
