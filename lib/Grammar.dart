import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tugas2/DetailGrammar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animations/animations.dart';

class GrammarScreen extends StatefulWidget {
  const GrammarScreen({super.key});

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
  bool bannerVisible = true;
  bool isLoading = true;
  List<bool> completed = [false, false, false];

  final List<Map<String, dynamic>> grammarList = [
    {
      'title': 'Parts of Speech',
      'description':
          'Kita akan berkenalan dengan jenis-jenis kata seperti noun...',
      'content': PartsOfSpeechContent(),
    },
    {
      'title': 'Articles',
      'description':
          'Articles adalah kata-kata kecil yang digunakan sebelum noun...',
      'content': ArticlesContent(),
    },
    {
      'title': 'To Be',
      'description':
          '"To be" adalah kata kerja penting dalam bahasa Inggris...',
      'content': ToBeContent(),
    },
  ];

  MarkAsDone(int index) {
    setState(() {
      completed[index] = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading
                ? Container()
                : bannerVisible
                ? MaterialBanner(
                  content: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Setiap halaman yang kamu baca adalah investasi untuk masa depanmu. 📚✨',
                      ),
                      TypewriterAnimatedText(
                        'Semangat belajar hari ini! Setiap kata yang kamu pelajari adalah langkah menuju kefasihan. 💪',
                      ),
                      TypewriterAnimatedText(
                        'Ketika kamu lelah, ingat alasan kamu mulai belajar.',
                      ),
                      TypewriterAnimatedText(
                        'Langkah kecil hari ini akan jadi lompatan besar suatu hari nanti.',
                      ),
                    ],
                    pause: Duration(seconds: 5),
                    onTap: () {
                      print("Tap Event");
                    },
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
                )
                : Container(),
            isLoading
                ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: const Text(
                    'Engliboo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                )
                : const Text(
                  'Engliboo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
            const SizedBox(height: 8),
            isLoading
                ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: const Text(
                    'Pelajari semua tentang grammar bahasa Inggris.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )
                : const Text(
                  'Pelajari semua tentang grammar bahasa Inggris.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
            const SizedBox(height: 24),

            isLoading
                ? Container()
                : AnimationLimiter(
                  child: Column(
                    children: List.generate(grammarList.length, (index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: GrammarCard(
                                title: grammarList[index]['title'],
                                description: grammarList[index]['description'],
                                detailContent: grammarList[index]['content'],
                                index: index,
                                isCompleted: completed[index],
                                onMarkAsDone: () => MarkAsDone(index),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
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
  final int index;
  final bool isCompleted;
  final VoidCallback onMarkAsDone;

  const GrammarCard({
    super.key,
    required this.title,
    required this.description,
    required this.detailContent,
    required this.index,
    required this.isCompleted,
    required this.onMarkAsDone,
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
                Expanded(
                  flex: 2,
                  child: Row(
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
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isCompleted) Icon(Icons.check, color: Colors.green),
                    ],
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailScreen(
                                title: title,
                                content: detailContent,
                              ),
                        ),
                      );
                    },
                    child: OpenContainer(
                      transitionType: ContainerTransitionType.fadeThrough,
                      transitionDuration: const Duration(milliseconds: 500),
                      closedElevation: 0,
                      closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      closedColor: Colors.transparent,
                      openBuilder:
                          (context, _) => DetailScreen(
                            title: title,
                            content: detailContent,
                          ),
                      closedBuilder:
                          (context, openContainer) => TextButton(
                            onPressed: openContainer,
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
                  ),
                  IconButton(
                    icon: const Icon(Icons.mark_as_unread),
                    onPressed:
                        isCompleted
                            ? null
                            : () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi'),
                                    content: Text(
                                      'Selesaikan grammar "$title"?',
                                    ),
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
                                          onMarkAsDone();
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Grammar "$title" diselesaikan.',
                                              ),
                                              duration: const Duration(
                                                seconds: 2,
                                              ),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    255,
                                                    51,
                                                    155,
                                                    240,
                                                  ),
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
