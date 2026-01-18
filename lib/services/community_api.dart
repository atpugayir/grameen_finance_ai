import 'dart:convert';
import 'package:http/http.dart' as http;

class CommunityApi {
  final String baseUrl;
  final String farmerId; // temporary auth header

  CommunityApi({required this.baseUrl, required this.farmerId});

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

  Future<void> createPost(String content) async {
    final req = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/community/posts"),
    );
    req.headers.addAll(_headers);
    req.fields["content"] = content;

    final streamed = await req.send();
    final body = await streamed.stream.bytesToString();
    if (streamed.statusCode >= 300) {
      throw Exception("createPost ${streamed.statusCode}: $body");
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

  Future<void> addComment(int postId, String comment) async {
    final req = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/community/posts/$postId/comment"),
    );
    req.headers.addAll(_headers);
    req.fields["comment"] = comment;

    final streamed = await req.send();
    final body = await streamed.stream.bytesToString();
    if (streamed.statusCode >= 300) {
      throw Exception("addComment ${streamed.statusCode}: $body");
    }
  }

  Future<List<dynamic>> fetchGroups() async {
    final res = await http.get(
      Uri.parse("$baseUrl/community/groups"),
      headers: _headers,
    );
    if (res.statusCode != 200) {
      throw Exception("fetchGroups ${res.statusCode}: ${res.body}");
    }
    return jsonDecode(res.body) as List<dynamic>;
  }

  Future<void> joinGroup(int groupId) async {
    final res = await http.post(
      Uri.parse("$baseUrl/community/groups/$groupId/join"),
      headers: _headers,
    );
    if (res.statusCode >= 300) {
      throw Exception("joinGroup ${res.statusCode}: ${res.body}");
    }
  }
}