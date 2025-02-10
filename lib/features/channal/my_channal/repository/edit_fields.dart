

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final editSettingsProvider = Provider((ref) => EditSettingsField(
    firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance));



class EditSettingsField {
  // we need access to firebase firesore and firebase auth - so we create an instance
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage = FirebaseStorage.instance;

  EditSettingsField({
    required this.firestore,
    required this.auth,
  });



  //methods
  editDisplayName(displayName) async {
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      "displayName": displayName,
    });
  }

  editUserName(username) async {
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      "username": username,
    });
  }

  editDesciption(description) async {
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      "description": description,
    });
  }


}
