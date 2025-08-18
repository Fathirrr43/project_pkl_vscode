import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://689ca29758a27b18087eea08.mockapi.io/akun";

  // Login
  Future<bool> login(String email, String password) async {
    final response = await http.get(Uri.parse('https://689ca29758a27b18087eea08.mockapi.io/akun'));

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      final user = users.firstWhere(
        (u) =>
            (u['username'] == email || u['email'] == email) && // cek dua kemungkinan
            u['password'] == password,
        orElse: () => null,
      );

      return user != null;
    }
    return false;
  }

  // Register
  Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": email, // atau "email": email, sesuaikan dengan API
        "password": password,
      }),
    );

    return response.statusCode == 201;
  }
}
