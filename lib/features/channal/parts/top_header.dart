import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

class TopHeader extends StatelessWidget {
  final UserModel user;
  const TopHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 38,
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(user.profilePic),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Text(
            user.displayName,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.blueGrey),
              children: [
                //user name
                TextSpan(text: "${user.username} "),
                //number of subscrption
                TextSpan(text: "${user.subscriptions.length} subs"),
                //number of videos
                TextSpan(text: "${user.videos} videos")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
