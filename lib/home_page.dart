import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/youtube.jpg',
              height: 36,
            ),
            const SizedBox(width: 4),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                height: 42,
              ),
            )
          ],
        ),
      ),
    );
  }
}
