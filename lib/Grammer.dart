import 'package:flutter/material.dart';
import 'DetailGrammer.dart';

class GrammarScreen extends StatefulWidget {
  const GrammarScreen({super.key});

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
  bool bannerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             bannerVisible ?
              MaterialBanner(
                content: const Text(
                  'Semangat belajar hari ini! Setiap kata yang kamu pelajari adalah langkah menuju kefasihan. 💪',
                  style: TextStyle(fontSize: 16),
                ),
                leading: const Icon(Icons.mood, color: Colors.blue),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        bannerVisible = !bannerVisible;
                      });
                    },
                    child: const Text('Mengerti'),
                  ),
                ],
              ):Container(),
            const Text(
              'Engliboo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pelajari semua tentang grammar bahasa Inggris.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            GrammarCard(
              title: 'Parts of Speech',
              description:
                  'Kita akan berkenalan dengan jenis-jenis kata seperti noun, adjective dan lainnya. Hal ini sangat penting agar kita dapat membentuk kalimat saat berkomunikasi.',
              detailContent: PartsOfSpeechContent(),
            ),
            const SizedBox(height: 16),
            GrammarCard(
              title: 'Articles',
              description:
                  'Articles adalah kata-kata kecil yang digunakan sebelum kata benda (noun) untuk memberi tahu apakah benda itu sudah diketahui atau belum oleh pembicara.',
              detailContent: ArticlesContent(),
            ),
            const SizedBox(height: 16),
            GrammarCard(
              title: 'To Be',
              description:
                  '"To be" adalah kata kerja penting dalam bahasa Inggris yang digunakan untuk menyatakan keadaan atau menjelaskan sesuatu. Bentuk dasar "to be" bisa berubah.',
              detailContent: ToBeContent(),
            ),
          ],
        ),
      ),
    );
  }
}

class GrammarCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget detailContent;

  const GrammarCard({
    super.key,
    required this.title,
    required this.description,
    required this.detailContent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.book, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Membuka materi "$title"...'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
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
                  IconButton(
                    icon: const Icon(Icons.mark_as_unread),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: Text('Selesaikan grammar "$title"?'),
                            actions: [
                              TextButton(
                                child: const Text('Tidak'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Iya'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Grammar "$title" diselesaikan.',
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
