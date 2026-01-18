import 'package:flutter/material.dart';
import '../mock_community_data.dart';

class GroupCard extends StatefulWidget {
  final Group group;
  const GroupCard({super.key, required this.group});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  void _join() {
    if (!widget.group.joined) {
      setState(() {
        widget.group.joined = true;
        widget.group.members++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final g = widget.group;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(g.icon, size: 48, color: Colors.green),
            Text(g.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("${g.members} Members"),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: g.joined ? null : _join,
                child: Text(g.joined ? "Joined" : "Join"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
