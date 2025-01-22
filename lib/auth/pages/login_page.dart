import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/repository/auth_service.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 25),
            child: Image.asset(
              'assets/images/youtube-signin.jpg',
              height: 150,
            ),
          ),
          Text(
            'Welcome to youtube',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 55),
            child: GestureDetector(
              onTap: () async {
                await ref.read(authServiceProvider).signInWithGoogle();
                //only once -- read mostly onTap
                //keep track of something -- watch
              },
              child: Image.asset(
                'assets/images/signinwithgoogle.png',
                height: 60,
              ),
            ),
          )
        ],
      )),
    );
  }
}
