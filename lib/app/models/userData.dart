// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    UserData({
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

    String? uid;
    DateTime? createdAt;
    String? name;
    String? email;
    String? phone;
    String? profile;
    List<String>? articleLiked;
    List<String>? giftFavourited;
    List<String>? giftLiked;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        uid: json["uid"] == null ? null : json["uid"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        profile: json["profile"] == null ? null : json["profile"],
        articleLiked: json["articleLiked"] == null ? null : List<String>.from(json["articleLiked"].map((x) => x)),
        giftFavourited: json["giftFavourited"] == null ? null : List<String>.from(json["giftFavourited"].map((x) => x)),
        giftLiked: json["giftLiked"] == null ? null : List<String>.from(json["giftLiked"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "profile": profile == null ? null : profile,
        "articleLiked": articleLiked == null ? null : List<dynamic>.from(articleLiked!.map((x) => x)),
        "giftFavourited": giftFavourited == null ? null : List<dynamic>.from(giftFavourited!.map((x) => x)),
        "giftLiked": giftLiked == null ? null : List<dynamic>.from(giftLiked!.map((x) => x)),
    };
}
