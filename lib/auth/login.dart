// Import library Flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import package google_fonts untuk custom font (harus install dulu di pubspec.yaml)
import 'package:google_fonts/google_fonts.dart';

// Import halaman Register (navigasi jika user belum punya akun)
import 'package:tridaya_travel/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input email & password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Flag untuk menandai apakah sedang loading atau tidak
  bool _isLoading = false;

  @override
  void dispose() {
    // Buang controller ketika widget tidak dipakai lagi (hindari memory leak)
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi login user
  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Login ke Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Ambil UID user
        String uid = userCredential.user!.uid;

        // Ambil data user dari Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          print("Nama: ${userData['firstName']} ${userData['lastName']}");
          print("Email: ${userData['email']}");

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login berhasil!')),
            );
            Navigator.pushReplacementNamed(context, '/navigation');
          }
        } else {
          // Kalau user tidak ditemukan di Firestore
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data user tidak ditemukan di Firestore')),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage = 'Email tidak terdaftar.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Password salah.';
        } else {
          errorMessage = 'Login gagal. ${e.message}';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }

      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan logo
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Image.asset('assets/images/logo2.png', height: 40),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView( // biar bisa scroll kalau keyboard muncul
            child: Form(
              key: _formKey, // form validasi
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Judul
                  Text(
                    'Selamat Datang',
                    style: GoogleFonts.poppins( // pakai Google Fonts
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  // Subjudul
                  Text(
                    'Masuk untuk melanjutkan perjalanan Anda',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 32.0),

                  // Input Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 14.0,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Masukkan format email yang valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  // Input Password
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Password',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 14.0,
                      ),
                    ),
                    obscureText: true, // sembunyikan password
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.0),

                  // Tombol Login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _loginUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1E4584),
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 2,
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white) // tampil loading
                          : Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Link ke halaman register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Anda belum punya akun?',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF1900A6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
