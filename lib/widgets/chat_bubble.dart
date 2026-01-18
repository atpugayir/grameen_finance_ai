import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.chat_bubble), // ✅ no const
            title: const Text("Financial Lessons"),
          ),
        ],
      ),
    );
  }
}
