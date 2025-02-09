// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

//out provider to handel the state
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
// this adds user to the fire store -- allows us to add the data
//but we also need to fetch the data back so we need other method below
  addUserDataToFirestore({
    required String displayName,
    required String email,
    required String username,
    required String profilePic,
    List<String>? subscriptions,
    int? videos,
    String? userId,
    required String description,
    String? type,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscriptions: subscriptions ?? [],
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

  Future<UserModel> fetchCurrentUserData() async {
    final currentUserMap =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();

    //we use from map here
    UserModel user = UserModel.fromMap(currentUserMap.data()!);
    return user;
  }
}
