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
        required this.author,
        required this.readTime,
        required this.publishedAt,
        required this.likeCount,
        required this.commentCount,
        required this.content,
        required this.comments,
    });

    int id;
    DateTime createdAt;
    String slug;
    String pictureUrl;
    String title;
    String author;
    int readTime;
    DateTime publishedAt;
    int likeCount;
    int commentCount;
    String content;
    List<Comment> comments;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        slug: json["slug"],
        pictureUrl: json["pictureURL"],
        title: json["title"],
        author: json["author"],
        readTime: json["readTime"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        likeCount: json["likeCount"],
        commentCount: json["commentCount"],
        content: json["content"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "slug": slug,
        "pictureURL": pictureUrl,
        "title": title,
        "author": author,
        "readTime": readTime,
        "publishedAt": publishedAt.toIso8601String(),
        "likeCount": likeCount,
        "commentCount": commentCount,
        "content": content,
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
