// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePic;

  final int videos;
  final String userId;
  final String description;
  final String type;
  final List<String> subscriptions;
  UserModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.profilePic,
    required this.videos,
    required this.userId,
    required this.description,
    required this.type,
    required this.subscriptions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'videos': videos,
      'userId': userId,
      'description': description,
      'type': type,
      'subscriptions': subscriptions,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        displayName: map['displayName'] as String,
        username: map['username'] as String,
        email: map['email'] as String,
        profilePic: map['profilePic'] as String,
        videos: map['videos'] as int,
        userId: map['userId'] as String,
        description: map['description'] as String,
        type: map['type'] as String,
        subscriptions: List<String>.from(
          (map['subscriptions'] ?? []),
        ));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
