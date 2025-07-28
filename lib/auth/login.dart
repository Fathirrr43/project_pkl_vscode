import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts
// import 'package:myapp/views/auth/register.dart'; // Import your Register page
import 'register.dart'; // Corrected import assuming register.dart is in the same folder
// import 'package:myapp/views/forgot_password.dart'; // Assuming you have a forgot password page

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      // Process login
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      // TODO: Implement actual login logic (e.g., Firebase Auth)

      // After successful login, navigate to home page
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Image.asset(
            'assets/images/logo2.png', // Ganti dengan path logo Anda
            height: 40,
          ),
        ),
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove shadow
        iconTheme: IconThemeData(color: Colors.black), // Set back button color
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true, // Extend body behind app bar
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Increased padding
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to start
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Selamat Datang Kembali',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Masuk untuk melanjutkan perjalanan Anda',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ), // Using Poppins
                  ),
                  SizedBox(height: 32.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan email',
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      // Basic email format validation
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Masukkan format email yang valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
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
                      suffixIcon: TextButton(
                        onPressed: () {
                          // TODO: Navigate to Forgot Password Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ),
                          ); // Example navigation
                        },
                        child: Text(
                          'Lupa Sandi?',
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 0, 2, 146),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ), // Using Poppins
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loginUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1E4584), // Warna biru tua
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ), // Lebih presisi dan modern
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: Colors.white, // Warna font putih agar kontras
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Anda belum punya akun?',
                        style: GoogleFonts.poppins(), // Using Poppins
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to Register Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          ); // Example navigation
                        },
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF1900A6),
                            fontWeight: FontWeight.bold,
                          ), // Using Poppins
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

// Assuming you have a ForgotPasswordPage
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: GoogleFonts.poppins(
            // Using Poppins as an example font
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove shadow
        iconTheme: IconThemeData(color: Colors.black), // Set back button color
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true, // Extend body behind app bar
      body: Center(
        child: Text(
          'Forgot Password Page',
        ), // Replace with your Forgot Password form
      ),
    );
  }
}
