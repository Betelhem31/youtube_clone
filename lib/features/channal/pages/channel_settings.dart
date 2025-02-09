import 'package:flutter/material.dart';
import 'package:youtube_clone/features/channal/my_channal/widgets/setting_field_item.dart';

class MyChannelSettings extends StatefulWidget {
  const MyChannelSettings({super.key});

  @override
  State<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends State<MyChannelSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {},
              value: "Betelhem",
            ),
            SizedBox(height: 14),
            SettingsItem(
              identifier: "Handle",
              onPressed: () {},
              value: "@-Betelhem",
            ),
            SizedBox(height: 14),
            SettingsItem(
              identifier: "Description",
              onPressed: () {},
              value: "",
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
    );
  }
}
