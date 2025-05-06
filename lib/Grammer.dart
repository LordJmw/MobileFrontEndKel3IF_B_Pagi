import 'package:flutter/material.dart';
import 'package:utsapl/DetailGrammer.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Engliboo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pelajari semua tentang grammar bahasa Inggris.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              
              ),
            ),
            const SizedBox(height: 24),
            
            GrammarCard(
              context: context,
              title: 'Parts of Speech',
              description: 'Kita akan berkendan dengan jenis-jenis kata seperti noun, adjective dan lainnya. Hai ini sangat penting agar kita dapat membentuk kalimat kita saat berkomunikasi',
              detailContent: PartsOfSpeechContent()
            ),
            const SizedBox(height: 16),
            
            GrammarCard(
              context: context,
              title: 'Articles',
              description: 'Articles adalah kata-kata kecil yang digunakan sebelum kata benda (noun) untuk memberi tahu apakah benda itu sudah diketahui atau belum diketahui oleh pembicara',
              detailContent: ArticlesContent()
            ),
            const SizedBox(height: 16),
            
            GrammarCard(
              context: context,
              title: 'To Be',
              description: '"To be" adalah kata kerja penting dalam Bahasa Inggris yang digunakan untuk menyatakan keadaan atau menjelaskan sesuatu. Bentuk dasar "to be" bisa berubah',
              detailContent: ToBeContent()
            ),
          ],
        ),
      ),
    );
  }

  Widget GrammarCard({required BuildContext context, required String title, required String description, required Widget detailContent,}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            children: [
              Icon(Icons.book, color: Colors.blue), 
              SizedBox(width: 8), 
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        title: title,
                        content: detailContent,
                      ),
                    ),
                  );
                },
                
                child: const Text(
                  'Pelajari lebih lanjut >',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}