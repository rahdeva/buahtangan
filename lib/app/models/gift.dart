// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
    Article({
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

    int id;
    DateTime createdAt;
    String slug;
    String pictureUrl;
    String title;
    String description;
    String type;
    List<String> category;
    String budgetRange;
    List<String> suitableEvent;
    List<String> suitableReceiver;
    HowToGet howToGet;
    int likeCount;
    int commentCount;
    List<Comment> comments;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        slug: json["slug"],
        pictureUrl: json["pictureURL"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        category: List<String>.from(json["category"].map((x) => x)),
        budgetRange: json["budgetRange"],
        suitableEvent: List<String>.from(json["suitableEvent"].map((x) => x)),
        suitableReceiver: List<String>.from(json["suitableReceiver"].map((x) => x)),
        howToGet: HowToGet.fromJson(json["howToGet"]),
        likeCount: json["likeCount"],
        commentCount: json["commentCount"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "slug": slug,
        "pictureURL": pictureUrl,
        "title": title,
        "description": description,
        "type": type,
        "category": List<dynamic>.from(category.map((x) => x)),
        "budgetRange": budgetRange,
        "suitableEvent": List<dynamic>.from(suitableEvent.map((x) => x)),
        "suitableReceiver": List<dynamic>.from(suitableReceiver.map((x) => x)),
        "howToGet": howToGet.toJson(),
        "likeCount": likeCount,
        "commentCount": commentCount,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    Comment({
        required this.userName,
        required this.comment,
        required this.date,
    });

    String userName;
    String comment;
    DateTime date;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userName: json["userName"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "comment": comment,
        "date": date.toIso8601String(),
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

    String offlineStoreText;
    String onlineStoreSpecialUrl;
    String shopeeUrl;
    String tokopediaUrl;
    String youtubeTutorialUrl;
    String tutorialArticleSlug;

    factory HowToGet.fromJson(Map<String, dynamic> json) => HowToGet(
        offlineStoreText: json["offlineStoreText"],
        onlineStoreSpecialUrl: json["onlineStoreSpecialURL"],
        shopeeUrl: json["shopeeURL"],
        tokopediaUrl: json["tokopediaURL"],
        youtubeTutorialUrl: json["youtubeTutorialURL"],
        tutorialArticleSlug: json["tutorialArticleSlug"],
    );

    Map<String, dynamic> toJson() => {
        "offlineStoreText": offlineStoreText,
        "onlineStoreSpecialURL": onlineStoreSpecialUrl,
        "shopeeURL": shopeeUrl,
        "tokopediaURL": tokopediaUrl,
        "youtubeTutorialURL": youtubeTutorialUrl,
        "tutorialArticleSlug": tutorialArticleSlug,
    };
}
