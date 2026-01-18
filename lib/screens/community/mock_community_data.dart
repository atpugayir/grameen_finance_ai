import 'package:flutter/material.dart';

class Post {
  final String user;
  final String time;
  final String content;
  final bool verified;
  int likes;

  Post({
    required this.user,
    required this.time,
    required this.content,
    this.verified = false,
    this.likes = 0,
  });
}

class Group {
  final String name;
  final IconData icon;
  int members;
  bool joined;

  Group({
    required this.name,
    required this.icon,
    required this.members,
    this.joined = false,
  });
}

/// ✅ RENAMED FROM Badge → CommunityBadge
class CommunityBadge {
  final String name;
  final String description;
  final IconData icon;
  final bool earned;

  CommunityBadge({
    required this.name,
    required this.description,
    required this.icon,
    this.earned = false,
  });
}

// ---------------- MOCK DATA ----------------

final mockPosts = [
  Post(
    user: "Ramesh Kumar",
    time: "2 hrs ago",
    content: "PM Kisan scheme helped me a lot this year.",
    verified: true,
    likes: 3,
  ),
  Post(
    user: "Sita Devi",
    time: "5 hrs ago",
    content: "How to open Jan Dhan account in village?",
  ),
];

final mockGroups = [
  Group(
    name: "Sarkari Yojana",
    icon: Icons.account_balance,
    members: 1200,
  ),
  Group(
    name: "Crop Insurance",
    icon: Icons.agriculture,
    members: 860,
  ),
];

final mockBadges = [
  CommunityBadge(
    name: "Gaon Ka Mitra",
    description: "Help 5 community members",
    icon: Icons.shield,
    earned: true,
  ),
  CommunityBadge(
    name: "Active Learner",
    description: "Read 10 finance lessons",
    icon: Icons.star,
  ),
];
