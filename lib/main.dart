import 'package:flutter/material.dart';
// import 'package:project_kel2_mfe/arranging_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Study English'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      "title": "Seninku",
      "Tenses": ["Simple Present", "Simple Past"],
    },
    {
      "title": "Halo Nama Saya ...",
      "Tenses": ["Simple Present", "Simple Past"],
    },
    {
      "title": "Di Taman",
      "Tenses": ["Simple Present", "Simple Past", "Simple Present Future"],
    },
    {
      "title": "Saya Suka Makan ...",
      "Tenses": ["Simple Present", "Simple Past", "Simple Present Future"],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.grey)),
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              //constraint itu seberapa besar widget bisa ambil tempat, make max untuk tau size layar
              bool smallScreen = constraints.maxWidth < 600;
              if (smallScreen) {
                return Center(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Engliboo",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        94,
                                        175,
                                        241,
                                      ),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          "Level 1",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.15,
                                        height: 20,
                                        child: LinearProgressIndicator(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(40),
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            217,
                                            217,
                                            217,
                                          ),
                                          value: 0.2,
                                          valueColor: AlwaysStoppedAnimation(
                                            const Color.fromARGB(
                                              255,
                                              51,
                                              155,
                                              240,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton.icon(
                                        onPressed: null,
                                        label: Text("5"),
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 51, 155, 240),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
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
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(
                                                                12,
                                                              ),
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
                                          color: Color.fromARGB(
                                            255,
                                            217,
                                            217,
                                            217,
                                          ),
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                                Radius.circular(
                                                                  20,
                                                                ),
                                                              ),
                                                          color:
                                                              const Color.fromARGB(
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
                                                              color:
                                                                  Colors.white,
                                                              size: 24,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                    right: 3,
                                                                  ),
                                                              child: Text(
                                                                "Completed",
                                                                style:
                                                                    TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                      : Padding(
                                                        padding: EdgeInsets.all(
                                                          4,
                                                        ),
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
                                                        padding:
                                                            EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                  Radius.circular(
                                                                    6,
                                                                  ),
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
                                                            padding:
                                                                EdgeInsets.all(
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
                                                          color:
                                                              const Color.fromARGB(
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
                                                                Radius.circular(
                                                                  20,
                                                                ),
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
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                      minimumSize:
                                                          WidgetStateProperty.all(
                                                            //width maks tapi height cuma 30
                                                            Size(
                                                              double.infinity,
                                                              30,
                                                            ),
                                                          ),
                                                      backgroundColor:
                                                          WidgetStateProperty.all<
                                                            Color
                                                          >(
                                                            const Color.fromARGB(
                                                              255,
                                                              217,
                                                              217,
                                                              217,
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
                                                      padding: EdgeInsets.all(
                                                        3,
                                                      ),
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
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
