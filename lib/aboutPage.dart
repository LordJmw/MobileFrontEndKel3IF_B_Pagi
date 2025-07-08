import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final developers = [
    {
      'name': 'James',
      'nim': '231111512',
      'image':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231111512.jpg',
    },
    {
      'name': 'Abdur Robi Alfian',
      'nim': '231111968',
      'image':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231111968.jpg',
    },
    {
      'name': 'Alvin',
      'nim': '231113040',
      'image':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231113040.jpg',
    },
    {
      'name': 'Zein Ath Thariq Badres',
      'nim': '231110299',
      'image':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231110299.jpg',
    },
  ];

  final List<bool> isClickedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A90E2), Color(0xFF7B68EE)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // App Name
                  const Text(
                    'Engliboo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Engliboo adalah aplikasi belajar bahasa Inggris gratis yang dirancang agar pembelajaran bisa merasakan kegiatan belajar yang interaktif dan menyenangkan. Dengan fitur-fitur modern dan pendekatan yang inovatif, kami membantu Anda menguasai bahasa Inggris dengan mudah dan efektif.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A90E2), Color(0xFF7B68EE)],
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Developers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7B68EE), Color(0xFF4A90E2)],
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: List.generate(developers.length, (index) {
                  final dev = developers[index];
                  final isClicked = isClickedList[index];

                  return SizedBox(
                    width: 160,
                    height: 160,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isClicked ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              isClicked ? Colors.white : Colors.black,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isClickedList[index] = !isClicked;
                          });
                        },
                        child:
                            isClicked
                                ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dev['name']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(dev['nim']!),
                                    const SizedBox(height: 4),
                                    const Text('Mikroskil'),
                                  ],
                                )
                                : Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(dev['image']!),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Click for more Info',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
