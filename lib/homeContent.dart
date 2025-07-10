import 'package:flutter/material.dart';
import 'package:tugas2/models/quizQuestion.dart';
import 'package:tugas2/quizPage.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map> materials = [
    {
      "title": "Halo Nama Saya ...",
      "Tenses": ["Simple Present", "Simple Past", "Self-Introduced"],
    },
    {
      "title": "Di Hari Minggu",
      "Tenses": ["Simple Present", "Simple Past"],
    },
    {
      "title": "Alam Sekitarku",
      "Tenses": ["Simple Present", "Simple Past"],
    },
    {
      "title": "Di Pantai",
      "Tenses": ["Simple Present", "Simple Past"],
    },
    {
      "title": "Aktivitas di Pantai",
      "Tenses": ["Simple Present", "Simple Past", "Simple Present Future"],
    },
    {
      "title": "Cita Cita ku",
      "Tenses": ["Simple Present", "Simple Past", "Simple Present Future"],
    },
  ];

  final List<QuizUnit> quizzes = [
    QuizUnit(
      title: "Bahasa Inggris Dasar",
      category: ["Vocabulary", "Grammar"],
      questions: [
        QuestionData(
          type: QuestionType.textfield,
          data: {
            'image':
                'https://png.pngtree.com/png-clipart/20190925/original/pngtree-rabbit_cartoon-png-image_4992696.jpg',
            'label': 'Kelinci',
            'correctAnswer': 'rabbit',
          },
        ),
        QuestionData(
          type: QuestionType.arrangingWords,
          data: {
            'question': 'saya suka burger',
            'words': ['I', 'You', 'like', 'soda', 'burger', 'always'],
            'answers': 'i like burger',
          },
        ),
        QuestionData(
          type: QuestionType.matching,
          data: {
            'pairs': {
              'i': 'saya',
              'you': 'kamu',
              'like': 'suka',
              'play': 'bermain',
              'sunday': 'minggu',
            },
          },
        ),
      ],
    ),
    QuizUnit(
      title: "Bahasa Inggris Dasar",
      category: ["Vocabulary", "Grammar"],
      questions: [
        QuestionData(
          type: QuestionType.textfield,
          data: {
            'image':
                'https://www.shutterstock.com/image-vector/vector-illustration-cute-baby-elephant-600nw-2245334003.jpg',
            'label': 'Gajah',
            'correctAnswer': 'elephant',
          },
        ),
        QuestionData(
          type: QuestionType.arrangingWords,
          data: {
            'question': 'saya sedang minum teh',
            'words': ['I', 'drink', 'drinking', 'soda', 'tea', 'am'],
            'answers': 'i am drinking tea',
          },
        ),
        QuestionData(
          type: QuestionType.matching,
          data: {
            'pairs': {
              'tree': 'pohon',
              'forest': 'hutan',
              'river': 'sungai',
              'sea': 'laut',
              'boat': 'kapal',
            },
          },
        ),
      ],
    ),
    QuizUnit(
      title: "Bahasa Inggris Dasar",
      category: ["Vocabulary", "Grammar"],
      questions: [
        QuestionData(
          type: QuestionType.textfield,
          data: {
            'image':
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQb7HVY9NRDSZI9OhgolM9omjXH4h9EbWclw&s',
            'label': 'Buaya',
            'correctAnswer': 'crocodile',
          },
        ),
        QuestionData(
          type: QuestionType.arrangingWords,
          data: {
            'question': 'saya melihat dia(laki-laki) kemarin',
            'words': ['I', 'see', 'him', 'saw', 'her', 'yesterday'],
            'answers': 'i saw him yesterday',
          },
        ),
        QuestionData(
          type: QuestionType.matching,
          data: {
            'pairs': {
              'sand': 'pasir',
              'coconut': 'kelapa',
              'beach': 'pantai',
              'reef': 'terumbu karang',
              'dive': 'menyelam',
            },
          },
        ),
      ],
    ),
    QuizUnit(
      title: "Bahasa Inggris Dasar",
      category: ["Vocabulary", "Grammar"],
      questions: [
        QuestionData(
          type: QuestionType.textfield,
          data: {
            'image':
                'https://images.vexels.com/media/users/3/151669/isolated/preview/cffc3cd93f88d0f459a0f069810dd2b5-deer-animal-cartoon.png',
            'label': 'Rusa',
            'correctAnswer': 'deer',
          },
        ),
        QuestionData(
          type: QuestionType.arrangingWords,
          data: {
            'question': 'saya akan minum',
            'words': ['I', 'am', 'will', 'drink', 'was', 'drank'],
            'answers': 'i will drink',
          },
        ),
        QuestionData(
          type: QuestionType.matching,
          data: {
            'pairs': {
              'fishing': 'memancing',
              'swimming': 'berenang',
              'sand castle': 'istana pasir',
              'picnic': 'piknik',
              'fly a kite': 'menerbangkan layang layang',
            },
          },
        ),
      ],
    ),
    QuizUnit(
      title: "Bahasa Inggris Dasar",
      category: ["Vocabulary", "Grammar"],
      questions: [
        QuestionData(
          type: QuestionType.textfield,
          data: {
            'image':
                'https://www.shutterstock.com/image-vector/cute-duck-green-head-standing-600nw-2314343477.jpg',
            'label': 'Bebek',
            'correctAnswer': 'duck',
          },
        ),
        QuestionData(
          type: QuestionType.arrangingWords,
          data: {
            'question': 'saya akan menjadi seorang koki',
            'words': ['I', 'am', 'be', 'a', 'will', 'chef'],
            'answers': 'i will be a chef',
          },
        ),
        QuestionData(
          type: QuestionType.matching,
          data: {
            'pairs': {
              'pemadam kebakaran': 'firefighter',
              'koki': 'chef',
              'polisi': 'police',
              'pengacara': 'lawyer',
              'dokter': 'doctor',
            },
          },
        ),
      ],
    ),
  ];

  final quiz = QuizUnit(
    title: "Bahasa Inggris Dasar",
    category: ["Vocabulary", "Grammar"],
    questions: [
      QuestionData(
        type: QuestionType.textfield,
        data: {
          'image':
              'https://png.pngtree.com/png-clipart/20190925/original/pngtree-rabbit_cartoon-png-image_4992696.jpg',
          'label': 'Kelinci',
          'correctAnswer': 'rabbit',
        },
      ),
      QuestionData(
        type: QuestionType.arrangingWords,
        data: {
          'question': 'saya suka burger',
          'words': ['I', 'You', 'like', 'soda', 'burger', 'always'],
          'answers': 'i like burger',
        },
      ),
      QuestionData(
        type: QuestionType.matching,
        data: {
          'pairs': {
            'i': 'saya',
            'you': 'kamu',
            'like': 'suka',
            'play': 'bermain',
            'sunday': 'minggu',
          },
        },
      ),
    ],
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //run ketika pertama kali di load pakai widgetsBinding.instance.addPostFrameCallBack
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Hi! Progress mu sudah 17%, pertahankan kerja bagusmu!",
          ),
          backgroundColor: const Color.fromARGB(255, 51, 155, 240),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: SingleChildScrollView(
          child:
          //constraint itu seberapa besar widget bisa ambil tempat, make max untuk tau size layar
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.95,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 51, 155, 240),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(7, 10, 7, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            isDense: true,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                            ),
                                            hintText:
                                                "Cari Topik Khusus Soal Latihan",
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  "CHAPTER 1",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 217, 217, 217),
                                    height: 1.0,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "Memperkenalkan Diri",
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 1.0,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        spacing: 10,
                        children:
                        //pakai list.generate daripada map karena map gabisa pake index
                        List.generate(materials.length, (index) {
                          int unitNumber = index + 1;
                          String unit = "Unit $unitNumber";
                          String unitTitle = materials[index]["title"];

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Color.fromARGB(255, 217, 217, 217),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(7, 10, 7, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        unit,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                            255,
                                            203,
                                            202,
                                            202,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            224,
                                            224,
                                            224,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                        ),
                                        child:
                                            index + 1 == 1
                                                ? Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                    color: const Color.fromARGB(
                                                      255,
                                                      94,
                                                      175,
                                                      241,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    spacing: 1,
                                                    children: [
                                                      Icon(
                                                        Icons.verified,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              right: 3,
                                                            ),
                                                        child: Text(
                                                          "Completed",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                : Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Text(
                                                    "200 XP",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                      ),
                                    ],
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      unitTitle,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          94,
                                          175,
                                          241,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children:
                                          //perlu pake as List<String> karena default dart dia gatau ini apa
                                          //jadi dianggap object, padahal kan udah list berisi string
                                          (materials[index]['Tenses']
                                                  as List<String>)
                                              .map((tense) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 8,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(6),
                                                          ),
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            220,
                                                            219,
                                                            219,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                        5,
                                                      ),
                                                      child: Text(
                                                        tense,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                              .toList(),
                                    ),
                                  ),
                                  index + 1 == 1
                                      ? Container()
                                      : Row(
                                        spacing: 5,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "0%",
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      192,
                                                      191,
                                                      191,
                                                    ),
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 10,
                                                  child: LinearProgressIndicator(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),

                                                    value: 0,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          217,
                                                          217,
                                                          217,
                                                        ),
                                                    valueColor:
                                                        AlwaysStoppedAnimation(
                                                          const Color.fromARGB(
                                                            255,
                                                            51,
                                                            155,
                                                            240,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (
                                                          BuildContext context,
                                                        ) => QuizPage(
                                                          quizStage:
                                                              quizzes[index - 1]
                                                                  .stages[0],
                                                        ),
                                                  ),
                                                );
                                              },
                                              style: ButtonStyle(
                                                elevation:
                                                    WidgetStateProperty.all(6),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                      //width maks tapi height cuma 30
                                                      Size(double.infinity, 30),
                                                    ),
                                                backgroundColor:
                                                    WidgetStateProperty.all<
                                                      Color
                                                    >(
                                                      const Color.fromARGB(
                                                        255,
                                                        77,
                                                        200,
                                                        81,
                                                      ),
                                                    ),
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3),
                                                child: Text(
                                                  "Mulai",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
