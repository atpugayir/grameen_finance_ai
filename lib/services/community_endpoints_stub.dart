import 'dart:convert';
import 'package:http/http.dart' as http;

/// Use this ONLY after your Swagger shows /community/posts etc.
class CommunityEndpoints {
  final String baseUrl;
  final String farmerId; // dev auth header

  CommunityEndpoints({required this.baseUrl, required this.farmerId});

  Map<String, String> get _headers => {"X-Farmer-Id": farmerId};

  Future<List<dynamic>> fetchPosts() async {
    final res = await http.get(
      Uri.parse("$baseUrl/community/posts"),
      headers: _headers,
    );
    if (res.statusCode != 200) {
      throw Exception("fetchPosts ${res.statusCode}: ${res.body}");
    }
    return jsonDecode(res.body) as List<dynamic>;
  }

  Future<void> createPost({required String content, String? audioPath}) async {
    final req = http.MultipartRequest("POST", Uri.parse("$baseUrl/community/posts"));
    req.headers.addAll(_headers);
    req.fields["content"] = content;

    if (audioPath != null) {
      req.files.add(await http.MultipartFile.fromPath("audio", audioPath));
    }

    final streamed = await req.send();
    final body = await streamed.stream.bytesToString();
    if (streamed.statusCode >= 300) {
      throw Exception("createPost ${streamed.statusCode}: $body");
    }
  }

  Future<void> addComment({
    required int postId,
    String? commentText,
    String? audioPath,
  }) async {
    final req = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/community/posts/$postId/comments"),
    );
    req.headers.addAll(_headers);

    if (commentText != null) req.fields["comment"] = commentText;
    if (audioPath != null) {
      req.files.add(await http.MultipartFile.fromPath("audio", audioPath));
    }

    final streamed = await req.send();
    final body = await streamed.stream.bytesToString();
    if (streamed.statusCode >= 300) {
      throw Exception("addComment ${streamed.statusCode}: $body");
    }
  }

  Future<void> likePost(int postId) async {
    final res = await http.post(
      Uri.parse("$baseUrl/community/posts/$postId/like"),
      headers: _headers,
    );
    if (res.statusCode >= 300) {
      throw Exception("likePost ${res.statusCode}: ${res.body}");
    }
  }

  Future<void> unlikePost(int postId) async {
    final res = await http.delete(
      Uri.parse("$baseUrl/community/posts/$postId/like"),
      headers: _headers,
    );
    if (res.statusCode >= 300) {
      throw Exception("unlikePost ${res.statusCode}: ${res.body}");
    }
  }
}