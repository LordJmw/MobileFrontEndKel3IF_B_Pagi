import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final Widget content;

  const DetailScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

Widget PartsOfSpeechContent() {
    return Text('ini Parts Of Speech Content ');
  }

  Widget ArticlesContent() {
    return Text('ini Articles Content');
  }

  Widget ToBeContent() {
    return Text('ini To Be Content');

  }
