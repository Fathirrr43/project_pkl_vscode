import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import package Google Fonts untuk styling font

// Halaman Register (Sign Up)
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input text
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Pastikan controller dibuang dari memori saat widget tidak digunakan
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi untuk memproses registrasi
  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Buat akun di Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );

        // Ambil UID user
        String uid = userCredential.user!.uid;

        // Simpan data tambahan ke Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'email': _emailController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Pindah ke halaman login atau home
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registrasi berhasil! Silakan login.'),
            ),
          );
          Navigator.pushReplacementNamed(context, '/login');
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'weak-password') {
          errorMessage = 'Password terlalu lemah.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'Email sudah terdaftar.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Format email tidak valid.';
        } else {
          errorMessage = 'Terjadi kesalahan. ${e.message}';
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar bagian atas halaman
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: GoogleFonts.poppins(
            // Pakai font Poppins dari Google Fonts
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        backgroundColor:
            Colors.transparent, // Membuat background AppBar transparan
        elevation: 0, // Menghilangkan shadow bawah AppBar
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Warna ikon (panah kembali)
        centerTitle: true, // Judul di tengah
      ),

      // Body halaman
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Jarak luar 24px
        child: Center(
          child: SingleChildScrollView(
            // Supaya bisa di-scroll jika layar kecil
            child: Form(
              key: _formKey, // Hubungkan Form dengan _formKey untuk validasi
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // rata kiri
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Judul
                  Text(
                    'Buat akun Anda',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // Sub-judul
                  Text(
                    'Daftar untuk memulai perjalanan Anda',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // Input nama depan & belakang dalam 1 baris
                  Row(
                    children: [
                      // Input Nama Depan
                      Expanded(
                        child: TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: 'Nama Depan',
                            filled: true,
                            fillColor: Colors.grey[200], // background abu-abu
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide.none, // hilangkan border default
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 14.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Depan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0), // jarak antar input
                      // Input Nama Belakang
                      Expanded(
                        child: TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Nama Belakang',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 14.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Belakang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),

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
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 14.0,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
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

                  const SizedBox(height: 16.0),

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
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 14.0,
                      ),
                    ),
                    obscureText: true, // supaya password disembunyikan
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24.0),

                  // Tombol Daftar
                  SizedBox(
                    width: double.infinity, // full width
                    child: ElevatedButton(
                      onPressed: _registerUser, // Panggil fungsi registrasi
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E4584), // biru tua
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ), // sudut rounded
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Buat Akun',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // Link ke halaman Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Anda sudah punya akun?',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        onPressed: () {
                          // kembali ke halaman sebelumnya (misalnya halaman login)
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1900A6),
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
