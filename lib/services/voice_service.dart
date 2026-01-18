import 'dart:convert';
import 'package:http/http.dart' as http;

class VoiceService {
  static const String baseUrl = "http://127.0.0.1:8000";

  static Future<Map<String, dynamic>> askAssistant(
    String text,
    String lang,
  ) async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/process-voice"),
    );

    request.fields["text_input"] = text;
    request.fields["language_code"] = lang;

    final response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode != 200) {
      throw Exception("Backend error");
    }

    return jsonDecode(response.body);
  }
}
