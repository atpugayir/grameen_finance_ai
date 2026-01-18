import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendService {
  // 👉 CHANGE only if backend URL changes
  static const String baseUrl = "http://127.0.0.1:8000";

  /// 🎙 Send voice/text query to backend
  static Future<Map<String, dynamic>> processVoice({
    required String text,
    required String languageCode,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/process-voice"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "text_input": text,
        "language_code": languageCode,
      },
    );

    if (response.statusCode != 200) {
      return {
        "reply": "Server error. Please try again.",
      };
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
