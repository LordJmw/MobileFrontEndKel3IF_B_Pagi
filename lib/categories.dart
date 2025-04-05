import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  bool _search = false;
  TextEditingController searchInput = TextEditingController(text: "");
  List<Map> materials = [
    {
      "topic": "Grammar",
      "deskripsi":
          "Kenali berbagai grammar yang digunakan dalam percakapan sehari-hari",
      "imageLink": "grammar.jpg",
    },
    {
      "topic": "Reading",
      "deskripsi":
          "Kemampuan membaca dengan cepat dan tepat, Latih kemampuan membaca bahasa inggris mu!",
      "imageLink": "reading.jpg",
    },
    {
      "topic": "Exercises",
      "deskripsi":
          "Mengerjakan Soal Latihan untuk Mengetes Pemahaman dan Pengetahuan Anda",
      "imageLink": "practice.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 238, 246),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Categories"),
        actions: [
          if (_search)
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 5, 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Apa yang anda cari ..."),
                    isDense: true,
                  ),
                  controller: searchInput,
                ),
              ),
            ),

          IconButton(
            icon: _search ? Icon(Icons.close) : Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              setState(() {
                _search = !_search;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Website untuk Belajar Bahasa Inggris Secara Mudah & Gratis",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),

                //untuk layar kecil (hp)
                LayoutBuilder(
                  builder: (context, constraints) {
                    //panjang layar maximum yang dapat widget ambil, agar tau ukuran layar
                    bool smallScreen = constraints.maxWidth < 600;
                    if (smallScreen) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                            materials.map((material) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      244,
                                      241,
                                      241,
                                    ),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        //flex ada 7, 100/7 = 14.22% jadi image akan mengambil sekitar 14.22*4 = 56.88%, dst
                                        flex: 4,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          child: Image.asset(
                                            material['imageLink'],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            material['topic'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Text(
                                            material['deskripsi'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                255,
                                                121,
                                                120,
                                                120,
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("Latihan Sekarang"),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                    Colors.green,
                                                  ),
                                              shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(6),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          materials.map((material) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    244,
                                    241,
                                    241,
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      //flex ada 7, 100/7 = 14.22% jadi image akan mengambil sekitar 14.22*4 = 56.88%, dst
                                      flex: 4,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        child: Image.asset(
                                          material['imageLink'],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          material['topic'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          material['deskripsi'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                              255,
                                              121,
                                              120,
                                              120,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Latihan Sekarang"),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                  Colors.green,
                                                ),
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
