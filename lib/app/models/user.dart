// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.uid,
        required this.createdAt,
        required this.name,
        required this.email,
        required this.phone,
        required this.profile,
        required this.articleLiked,
        required this.giftFavourited,
        required this.giftLiked,
    });

    String uid;
    DateTime createdAt;
    String name;
    String email;
    String phone;
    String profile;
    List<String> articleLiked;
    List<String> giftFavourited;
    List<String> giftLiked;

    factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profile: json["profile"],
        articleLiked: List<String>.from(json["articleLiked"].map((x) => x)),
        giftFavourited: List<String>.from(json["giftFavourited"].map((x) => x)),
        giftLiked: List<String>.from(json["giftLiked"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "email": email,
        "phone": phone,
        "profile": profile,
        "articleLiked": List<dynamic>.from(articleLiked.map((x) => x)),
        "giftFavourited": List<dynamic>.from(giftFavourited.map((x) => x)),
        "giftLiked": List<dynamic>.from(giftLiked.map((x) => x)),
    };
}
