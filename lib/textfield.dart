import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({super.key});

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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/kelinci.png',
                      width: 200,
                      height: 200,
                    ),
                    Text("Kelinci"),
                  ],
                ),
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
              ),

              Container(
                // color: Color.fromRGBO(87, 204, 2, 1),
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(87, 204, 2, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(88, 167, 0, 1),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "PERIKSA",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Jellee",
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              // TextButton(onPressed: (){}, style: ButtonStyle(backgroundColor: ), child: Text("PERIKSA"))
            ],
          ),
        ),
      ),
    );
  }
}
