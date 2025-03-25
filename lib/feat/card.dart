import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  const myCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      // Ini Box 1
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.close, size: 60),
                  Expanded(
                    child: LinearProgressIndicator(
                      minHeight: 30,
                      borderRadius: BorderRadius.circular(20),
                      value: 0.5, // Ganti sesuai progres (0.0 - 1.0)
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 10,
                ),
                child: Text(
                  "Pilih gambar yang benar",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins-Medium",
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Warna background
                      shape: BoxShape.rectangle, // Bentuk kotak
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        15,
                      ), // Bisa diatur untuk kotak melengkung
                    ),
                    child: IconButton(
                      icon: Icon(Icons.volume_up),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 0,
                      ),
                      child: Text(
                        "snake",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "Poppins-Medium",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
