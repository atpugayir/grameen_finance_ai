import 'package:flutter/material.dart';
import 'mock_community_data.dart';
import 'widgets/post_card.dart';
import 'widgets/group_card.dart';
import 'widgets/badge_tile.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Community",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green.shade800,

          // ✅ TAB BAR FIX
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,            // selected tab
            unselectedLabelColor: Colors.white70, // unselected tabs
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            tabs: [
              Tab(text: "Discussions"),
              Tab(text: "Groups"),
              Tab(text: "Badges"),
            ],
          ),
        ),

        // ✅ TAB CONTENT
        body: TabBarView(
          children: [
            // ---------------- DISCUSSIONS ----------------
            ListView(
              padding: const EdgeInsets.all(16),
              children: mockPosts
                  .map((post) => PostCard(post: post))
                  .toList(),
            ),

            // ---------------- GROUPS ----------------
            GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: mockGroups
                  .map((group) => GroupCard(group: group))
                  .toList(),
            ),

            // ---------------- BADGES ----------------
            ListView(
              padding: const EdgeInsets.all(16),
              children: mockBadges
                  .map((badge) => BadgeTile(badge: badge))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
