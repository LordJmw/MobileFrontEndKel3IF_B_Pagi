import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tugas2/feat/register.dart';
import 'package:tugas2/homePage.dart';
import 'package:tugas2/main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selamat Datang Kembali!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                'Masukkan data akun anda',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 290,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 290,
                height: 40,
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 290,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.lightBlue,
                    elevation: 10,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      EasyLoading.show(status: 'Loading...');
                      await Future.delayed(Duration(seconds: 2));
                      EasyLoading.showSuccess(
                        'Verified!',
                        duration: Duration(seconds: 1),
                      );
                      await Future.delayed(Duration(seconds: 1));
                      EasyLoading.dismiss();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: Text(
                      'MASUK',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 70,
                      endIndent: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "atau",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 70,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 290,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                    elevation: 10,
                    shadowColor: const Color.fromARGB(255, 187, 186, 186),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Masuk dengan Google',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(68, 92, 136, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 290,
                child: Text.rich(
                  TextSpan(
                    text: "Dengan masuk ke Engliboo, anda menyetujui ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 119, 119, 119),
                      fontFamily: "Poppins",
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: "Ketentuan ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "dan "),
                      TextSpan(
                        text: "Kebijakan Privasi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: " kami"),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'belum punya akun? ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: Text(
                      'Daftar Sekarang',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
