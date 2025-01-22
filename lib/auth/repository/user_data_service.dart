// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/model/user_model.dart';

final userDataServiceProvider = Provider((ref) => UserDataService(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ));

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({
    required this.auth,
    required this.firestore,
  });

  addUserDataToFirestore({
    required String displayName,
    required String email,
    required String username,
    required String profilePic,
    required List<String> subscriptions,
    required int videos,
    required String userId,
    required String description,
    required String type,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscriptions: [],
      videos: 0,
      userId: auth.currentUser!.uid,
      description: description,
      type: "user",
    );
    // collection and add the collection
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }
}
