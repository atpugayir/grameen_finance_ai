import 'package:flutter/material.dart';
import '../mock_community_data.dart';

class BadgeTile extends StatelessWidget {
  final CommunityBadge badge;

  const BadgeTile({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          badge.icon,
          color: badge.earned ? Colors.amber : Colors.grey,
        ),
        title: Text(badge.name),
        subtitle: Text(badge.description),
        trailing: badge.earned
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const SizedBox(
                width: 80,
                child: LinearProgressIndicator(value: 0.4),
              ),
      ),
    );
  }
}
