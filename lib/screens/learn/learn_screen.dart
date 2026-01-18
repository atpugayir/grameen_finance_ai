import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/pdf_service.dart';
import '../../services/audio_service.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  // 📺 YouTube learning videos
  static const List<Map<String, String>> youtubeVideos = [
    {
      "title": "Practical Guide for Budgeting",
      "url": "https://youtu.be/T7JHfLGm_GY",
    },
    {
      "title": "Top 5 Government Schemes for Farmers",
      "url": "https://youtu.be/aAMotAMyS9s",
    },
    {
      "title": "How to Take Control of Your Money",
      "url": "https://youtu.be/w_RKtck8XCA",
    },
  ];

  Future<void> _openYoutube(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open YouTube video");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------------- OFFLINE CONTENT
          const Text(
            "Offline Learning",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text("Crop Insurance (PDF)"),
            onTap: () {
              PdfService.openAssetPdf("crop_insurance.pdf");
            },
          ),

          ListTile(
            leading: const Icon(Icons.audiotrack),
            title: const Text("Welcome Audio"),
            onTap: () async {
              try {
                await AudioService.playFromAsset("audio/welcome_en.mp3");
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Offline audio not supported on Web"),
                  ),
                );
              }
            },
          ),

          const Divider(height: 32),

          // ---------------- ONLINE CONTENT
          const Text(
            "Video Lessons (YouTube)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          ...youtubeVideos.map(
            (video) => ListTile(
              leading: const Icon(Icons.play_circle_fill),
              title: Text(video["title"]!),
              onTap: () => _openYoutube(video["url"]!),
            ),
          ),
        ],
      ),
    );
  }
}
