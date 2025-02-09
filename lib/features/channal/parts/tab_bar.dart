import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.only(top: 12),
        tabs: [
          Text("Home"),
          Text("Videos"),
          Text("Shorts"),
          Text("Community"),
          Text("Playlists"),
          Text("Channels"),
          Text("about"),
        ],
      ),
    );
  }
}
