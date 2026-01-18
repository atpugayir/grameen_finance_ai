import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';

class AuthService {
  static const String baseUrl = "http://localhost:8000";

  // ---------------- LOGIN ----------------
  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await TokenStorage().saveToken(data["access_token"]);
      return true;
    }
    return false;
  }

  // ---------------- SIGNUP ----------------
  static Future<bool> signup(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    return response.statusCode == 200;
  }

  // ---------------- CURRENT USER ----------------
  static Future<Map<String, dynamic>?> getMe() async {
    final token = await TokenStorage().getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse("$baseUrl/me"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // ---------------- LOGOUT ----------------
  static Future<void> logout() async {
    await TokenStorage().clearToken();
  }
}
