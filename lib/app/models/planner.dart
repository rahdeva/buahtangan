// To parse this JSON data, do
//
//     final planner = plannerFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

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

    String? id;
    DateTime? createdAt;
    String? pictureUrl;
    String? receiver;
    DateTime? date;
    String? event;
    String? budget;
    DateTime? notifDate;
    String? messages;
    String? notes;
    List<String>? giftSlugs;

    factory Planner.fromJson(Map<String, dynamic> json) => Planner(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        pictureUrl: json["pictureURL"] == null ? null : json["pictureURL"],
        receiver: json["receiver"] == null ? null : json["receiver"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        event: json["event"] == null ? null : json["event"],
        budget: json["budget"] == null ? null : json["budget"],
        notifDate: json["notifDate"] == null ? null : DateTime.parse(json["notifDate"]),
        messages: json["messages"] == null ? null : json["messages"],
        notes: json["notes"] == null ? null : json["notes"],
        giftSlugs: json["giftSlugs"] == null ? null : List<String>.from(json["giftSlugs"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "pictureURL": pictureUrl == null ? null : pictureUrl,
        "receiver": receiver == null ? null : receiver,
        "date": date == null ? null : date!.toIso8601String(),
        "event": event == null ? null : event,
        "budget": budget == null ? null : budget,
        "notifDate": notifDate == null ? null : notifDate!.toIso8601String(),
        "messages": messages == null ? null : messages,
        "notes": notes == null ? null : notes,
        "giftSlugs": giftSlugs == null ? null : List<dynamic>.from(giftSlugs!.map((x) => x)),
    };
}