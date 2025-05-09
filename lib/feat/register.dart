import 'package:flutter/material.dart';
import 'package:utsfrontend/feat/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  bool _isChecked = false;
  String? _chekboxUnchecked;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Buat Akun Baru",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 20),

                // Username field
                SizedBox(
                  width: 290,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        height: 0.6,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 0.5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Pengguna tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Email field
                SizedBox(
                  width: 290,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        height: 0.6,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 0.5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      } else if (!value.contains('@')) {
                        return 'mohon gunakan alamat email yang valid';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Password field
                SizedBox(
                  width: 290,
                  height: 40,
                  child: TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        height: 0.6,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 0.5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      }
                      _password = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Password confirmation fieldd
                SizedBox(
                  width: 290,
                  height: 40,
                  child: TextFormField(
                    obscureText: _obscureTextConfirm,
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi Kata Sandi',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        height: 0.6,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 0.5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi kata sandi anda';
                      } else if (value != _password) {
                        return 'kata sandi tidak sesuai';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _chekboxUnchecked =
                            _isChecked
                                ? null
                                : "Cek Jika Sudah Membaca Ketentuan dan Kebijakan Privasi";
                      });
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
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
                    child: Text(
                      'DAFTAR',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
                        Image.asset(
                          'assets/images/google.png',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Daftar dengan Google',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val!;
                          _chekboxUnchecked = null;
                        });
                      },
                    ),
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

                    //checkbox tidak dicek
                  ],
                ),
                if (_chekboxUnchecked != null)
                  Text(
                    _chekboxUnchecked!,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
