import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channal/my_channal/repository/edit_fields.dart';
import 'package:youtube_clone/features/channal/my_channal/widgets/edit_setting_dialog.dart';
import 'package:youtube_clone/features/channal/my_channal/widgets/setting_field_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
        data: (currentUser) => Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 170,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/flutter background.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 210,
                          top: 60,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 20,
                          child: Image.asset(
                            "assets/icons/camera.png",
                            height: 34,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    //second part
                    SizedBox(height: 14),
                    SettingsItem(
                      identifier: "Name",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SettingsDialog(
                            identifier: "DispalyName",
                            onSave: (name) {
                              ref
                                  .watch(editSettingsProvider)
                                  .editDisplayName(name);
                            },
                          ),
                        );
                      },
                      value: currentUser.displayName,
                    ),
                    SizedBox(height: 14),
                    SettingsItem(
                        identifier:"Username",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Username",
                              onSave: (username) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editUserName(username);
                              },
                            ),
                          );
                        },
                        value: currentUser.username),
                    SizedBox(height: 14),
                    SettingsItem(
                      identifier: "Description",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SettingsDialog(
                            identifier: "Description",
                            onSave: (description) {
                              ref
                                  .watch(editSettingsProvider)
                                  .editDesciption(description);
                            },
                          ),
                        );
                      },
                      value: currentUser.description,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Keep all my subscribers prvate"),
                          Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                isSwitched = value;
                                setState(() {});
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Text(
                        "Changes made on your names and profile picture but no body cares",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )),
            ),
        error: (error, stackTrace) => ErrorPage(),
        loading: () => Loader());
  }
}
