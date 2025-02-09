import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channal/parts/buttons.dart';
import 'package:youtube_clone/features/channal/parts/tab_bar.dart';
import 'package:youtube_clone/features/channal/parts/tab_pages.dart';
import 'package:youtube_clone/features/channal/parts/top_header.dart';

class MyChannalScreen extends ConsumerWidget {
  const MyChannalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          data: (currentUser) => DefaultTabController(
              length: 7,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Column(
                        children: [
                          //users data (top header)
                          TopHeader(user: currentUser),
                          Text("More about this channel"),
                          MyButton(),
                          //create tab bar
                          TabBarPage(),
                          TabPages(),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          error: (error, stackTrace) => ErrorPage(),
          loading: () => Loader(),
        );
  }
}
