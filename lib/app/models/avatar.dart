// To parse this JSON data, do
//
//     final avatar = avatarFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Avatar avatarFromJson(String str) => Avatar.fromJson(json.decode(str));

String avatarToJson(Avatar data) => json.encode(data.toJson());

class Avatar {
    Avatar({
        required this.id,
        required this.avatarUrl,
    });

    int? id;
    String? avatarUrl;

    factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        id: json["id"] == null ? null : json["id"],
        avatarUrl: json["avatarURL"] == null ? null : json["avatarURL"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "avatarURL": avatarUrl == null ? null : avatarUrl,
    };
}
