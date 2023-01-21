// To parse this JSON data, do
//
//     final planner = plannerFromJson(jsonString);

import 'dart:convert';

Planner plannerFromJson(String str) => Planner.fromJson(json.decode(str));

String plannerToJson(Planner data) => json.encode(data.toJson());

class Planner {
    Planner({
        required this.id,
        required this.createdAt,
        required this.pictureUrl,
        required this.receiver,
        required this.date,
        required this.event,
        required this.budget,
        required this.notifDate,
        required this.messages,
        required this.notes,
        required this.giftSlugs,
    });

    int id;
    DateTime createdAt;
    String pictureUrl;
    String receiver;
    DateTime date;
    String event;
    String budget;
    DateTime notifDate;
    String messages;
    String notes;
    List<String> giftSlugs;

    factory Planner.fromJson(Map<String, dynamic> json) => Planner(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        pictureUrl: json["pictureURL"],
        receiver: json["receiver"],
        date: DateTime.parse(json["date"]),
        event: json["event"],
        budget: json["budget"],
        notifDate: DateTime.parse(json["notifDate"]),
        messages: json["messages"],
        notes: json["notes"],
        giftSlugs: List<String>.from(json["giftSlugs"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "pictureURL": pictureUrl,
        "receiver": receiver,
        "date": date.toIso8601String(),
        "event": event,
        "budget": budget,
        "notifDate": notifDate.toIso8601String(),
        "messages": messages,
        "notes": notes,
        "giftSlugs": List<dynamic>.from(giftSlugs.map((x) => x)),
    };
}
