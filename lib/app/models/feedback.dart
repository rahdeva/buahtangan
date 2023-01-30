// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Feedback feedbackFromJson(String str) => Feedback.fromJson(json.decode(str));

String feedbackToJson(Feedback data) => json.encode(data.toJson());

class Feedback {
    Feedback({
        required this.id,
        required this.userName,
        required this.createdAt,
        required this.feedback,
        required this.rating,
    });

    String? id;
    String? userName;
    DateTime? createdAt;
    String? feedback;
    double? rating;

    factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"] == null ? null : json["id"],
        userName: json["userName"] == null ? null : json["userName"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        feedback: json["feedback"] == null ? null : json["feedback"],
        rating: json["rating"].toDouble() == null ? null : json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userName": userName == null ? null : userName,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "feedback": feedback == null ? null : feedback,
        "rating": rating == null ? null : rating,
    };
}
