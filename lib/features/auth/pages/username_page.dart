import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;
  final String email;
 const UsernamePage({required this.displayName, required this.profilePic, required this.email, super.key});

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValidate = true;

  //here is the method to chech the username (no similar username)
  void validateUsername() async {
    // we get acess of all users
    final usersMap = await FirebaseFirestore.instance.collection("users").get();
    //we have now list of all users
    final users = usersMap.docs.map((user) => user).toList();
    String? targetedUsername;

    //now we are going to check every user list
    for (var user in users) {
      if (usernameController.text = user.data()["username"]) {
        targetedUsername = user.data()["username"];
        isValidate = false;
        setState(() {});
      }
      //if they change the name we allow them to continue
      if (usernameController.text != targetedUsername) {
        isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 26,
              vertical: 14,
            ),
            child: Text(
              "Enter the usrername",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              child: TextFormField(
                //onchanged is a listener that triggers everytime we relase key on akeyboard
                onChanged: (username) {
                  validateUsername();
                },
                autovalidateMode: AutovalidateMode.always,
                validator: (username) {
                  return isValidate ? null : "username already taken";
                },
                //username should be checked on the database if it is already exist or nor
                key: formKey,
                controller: usernameController,
                decoration: InputDecoration(
                  suffixIcon: isValidate
                      ? Icon(Icons.verified_user_rounded)
                      : Icon(Icons.cancel),
                  suffixIconColor: isValidate ? Colors.green : Colors.red,
                  hintText: "Insert username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
            child: FlatButton(
              text: "CONTINUE",
              onPressed: () async {
                // add users data inside database
                isValidate
                    ? await ref
                        .read(userDataServiceProvider)
                        .addUserDataToFirestore(
                          displayName: widget.displayName,
                          email: widget.email,
                          username: usernameController.text,
                          profilePic: widget.profilePic,
                          description: '',
                        )
                    : null;
              },
              colour: isValidate ? Colors.green : Colors.green.shade100,
            ),
          )
        ],
      )),
    );
  }
}
