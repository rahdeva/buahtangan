// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

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
        required this.author,
        required this.readTime,
        required this.publishedAt,
        required this.likeCount,
        required this.commentCount,
        required this.content,
        required this.comments,
    });

    int? id;
    DateTime? createdAt;
    String? slug;
    String? pictureUrl;
    String? title;
    String? author;
    String? readTime;
    DateTime? publishedAt;
    int? likeCount;
    int? commentCount;
    String? content;
    List<Comment>? comments;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        slug: json["slug"]  == null ? null : json["slug"],
        pictureUrl: json["pictureURL"]  == null ? null : json["pictureURL"],
        title: json["title"]  == null ? null : json["title"],
        author: json["author"]  == null ? null : json["author"],
        readTime: json["readTime"]  == null ? null : json["readTime"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        likeCount: json["likeCount"]  == null ? null : json["likeCount"],
        commentCount: json["commentCount"]  == null ? null : json["commentCount"],
        content: json["content"]  == null ? null : json["content"],
        comments: json["comments"] == null ? null :  List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "slug": slug == null ? null : slug,
        "pictureURL": pictureUrl == null ? null : pictureUrl,
        "title": title == null ? null : title,
        "author": author == null ? null : author,
        "readTime": readTime == null ? null : readTime,
        "publishedAt": publishedAt == null ? null : publishedAt!.toIso8601String(),
        "likeCount": likeCount == null ? null : likeCount,
        "commentCount": commentCount == null ? null : commentCount,
        "content": content == null ? null : content,
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
