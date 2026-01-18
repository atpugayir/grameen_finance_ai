import 'package:flutter/material.dart';
import '../mock_community_data.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  void _like() {
    setState(() => widget.post.likes++);
  }

  void _reply() {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text("Reply"),
        content: Text("Voice/text reply feature coming soon."),
      ),
    );
  }

  void _share() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Post shared")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.post;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    p.user,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (p.verified)
                  const Icon(Icons.verified, color: Colors.blue, size: 18),
                const SizedBox(width: 6),
                Text(p.time, style: const TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 10),
            Text(p.content, maxLines: 3, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.thumb_up),
                  label: Text("Like (${p.likes})"),
                  onPressed: _like,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.mic),
                  label: const Text("Reply"),
                  onPressed: _reply,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                  onPressed: _share,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
