import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  const myCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.close),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0, // Ganti sesuai progres (0.0 - 1.0)
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Pilih gambar yang benar",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
