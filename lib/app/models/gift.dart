// To parse this JSON data, do
//
//     final gift = giftFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Gift giftFromJson(String str) => Gift.fromJson(json.decode(str));

String giftToJson(Gift data) => json.encode(data.toJson());

class Gift {
    Gift({
        required this.id,
        required this.createdAt,
        required this.slug,
        required this.pictureUrl,
        required this.title,
        required this.description,
        required this.type,
        required this.category,
        required this.budgetRange,
        required this.suitableEvent,
        required this.suitableReceiver,
        required this.howToGet,
        required this.likeCount,
        required this.commentCount,
        required this.comments,
    });

    int? id;
    DateTime? createdAt;
    String? slug;
    String? pictureUrl;
    String? title;
    String? description;
    String? type;
    List<String>? category;
    String? budgetRange;
    List<String>? suitableEvent;
    List<String>? suitableReceiver;
    HowToGet? howToGet;
    int? likeCount;
    int? commentCount;
    List<Comment>? comments;

    factory Gift.fromJson(Map<String, dynamic> json) => Gift(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        slug: json["slug"] == null ? null : json["slug"],
        pictureUrl: json["pictureURL"] == null ? null : json["pictureURL"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        type: json["type"] == null ? null : json["type"],
        category: json["category"] == null ? null : List<String>.from(json["category"].map((x) => x)),
        budgetRange: json["budgetRange"] == null ? null : json["budgetRange"],
        suitableEvent: json["suitableEvent"] == null ? null : List<String>.from(json["suitableEvent"].map((x) => x)),
        suitableReceiver: json["suitableReceiver"] == null ? null : List<String>.from(json["suitableReceiver"].map((x) => x)),
        howToGet: json["howToGet"] == null ? null : HowToGet.fromJson(json["howToGet"]),
        likeCount: json["likeCount"] == null ? null : json["likeCount"],
        commentCount: json["commentCount"] == null ? null : json["commentCount"],
        comments: json["comments"] == null ? null : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "slug": slug == null ? null : slug,
        "pictureURL": pictureUrl == null ? null : pictureUrl,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "type": type == null ? null : type,
        "category": category == null ? null : List<dynamic>.from(category!.map((x) => x)),
        "budgetRange": budgetRange == null ? null : budgetRange,
        "suitableEvent": suitableEvent == null ? null : List<dynamic>.from(suitableEvent!.map((x) => x)),
        "suitableReceiver": suitableReceiver == null ? null : List<dynamic>.from(suitableReceiver!.map((x) => x)),
        "howToGet": howToGet == null ? null : howToGet!.toJson(),
        "likeCount": likeCount == null ? null : likeCount,
        "commentCount": commentCount == null ? null : commentCount,
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toJson())),
    };
}

class Comment {
    Comment({
        required this.userName,
        required this.comment,
        required this.date,
    });

    String? userName;
    String? comment;
    DateTime? date;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userName: json["userName"] == null ? null : json["userName"],
        comment: json["comment"] == null ? null : json["comment"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "userName": userName == null ? null : userName,
        "comment": comment == null ? null : comment,
        "date": date == null ? null : date!.toIso8601String(),
    };
}

class HowToGet {
    HowToGet({
        required this.offlineStoreText,
        required this.onlineStoreSpecialUrl,
        required this.shopeeUrl,
        required this.tokopediaUrl,
        required this.youtubeTutorialUrl,
        required this.tutorialArticleSlug,
    });

    String? offlineStoreText;
    String? onlineStoreSpecialUrl;
    String? shopeeUrl;
    String? tokopediaUrl;
    String? youtubeTutorialUrl;
    String? tutorialArticleSlug;

    factory HowToGet.fromJson(Map<String, dynamic> json) => HowToGet(
        offlineStoreText: json["offlineStoreText"] == null ? null : json["offlineStoreText"],
        onlineStoreSpecialUrl: json["onlineStoreSpecialURL"] == null ? null : json["onlineStoreSpecialURL"],
        shopeeUrl: json["shopeeURL"] == null ? null : json["shopeeURL"],
        tokopediaUrl: json["tokopediaURL"] == null ? null : json["tokopediaURL"],
        youtubeTutorialUrl: json["youtubeTutorialURL"] == null ? null : json["youtubeTutorialURL"],
        tutorialArticleSlug: json["tutorialArticleSlug"] == null ? null : json["tutorialArticleSlug"],
    );

    Map<String, dynamic> toJson() => {
        "offlineStoreText": offlineStoreText == null ? null : offlineStoreText,
        "onlineStoreSpecialURL": onlineStoreSpecialUrl == null ? null : onlineStoreSpecialUrl,
        "shopeeURL": shopeeUrl == null ? null : shopeeUrl,
        "tokopediaURL": tokopediaUrl == null ? null : tokopediaUrl,
        "youtubeTutorialURL": youtubeTutorialUrl == null ? null : youtubeTutorialUrl,
        "tutorialArticleSlug": tutorialArticleSlug == null ? null : tutorialArticleSlug,
    };
}