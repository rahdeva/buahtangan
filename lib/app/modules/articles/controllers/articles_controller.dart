import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlesController extends GetxController {
  static ArticlesController find = Get.find();
  TextEditingController searchC = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  // List<Article> dataList = [];

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  Stream<List<Article>> getArticles() {
    return FirebaseFirestore.instance
      .collection('articles')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => Article.fromJson(doc.data())
        ).toList()
      );
  }

  Future createNewArticle() async {
    const slug = "new-article";
    final docArticle = FirebaseFirestore.instance
      .collection("articles")
      .doc(slug);
    final article = Article(
      id: 3, 
      createdAt: DateTime.now(),
      slug: slug, 
      pictureUrl: "https://picsum.photos/500/500", 
      title: "New Article", 
      author: "Ngurah", 
      readTime: "1,", 
      publishedAt: DateTime.now(),
      likeCount: 100, 
      commentCount: 100, 
      content: "Ini adalah konten", 
      comments: [
        Comment(
          userName: "John", 
          comment: "Mantap", 
          date: DateTime.now(),
        )
      ]
    );

    final json = article.toJson();
    await docArticle.set(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }

  Future updatePlanner() async {
    const slug = "new-article";
    final docArticle = FirebaseFirestore.instance
      .collection("articles")
      .doc(slug);
    final article = Article(
      id: 3, 
      createdAt: DateTime.now(),
      slug: slug, 
      pictureUrl: "https://picsum.photos/500/500", 
      title: "New Article Update", 
      author: "Ngurah", 
      readTime: "1,", 
      publishedAt: DateTime.now(),
      likeCount: 100, 
      commentCount: 100, 
      content: "Ini adalah konten", 
      comments: [
        Comment(
          userName: "John", 
          comment: "Mantap", 
          date: DateTime.now(),
        )
      ]
    );

    final json = article.toJson();
    await docArticle.update(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }

  // Future deletePlanner() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   String uid = auth.currentUser!.uid;
  //   final docPlanner = FirebaseFirestore.instance
  //     .collection("articles")
  //     .doc(uid)
  //     .collection("plannerData")
  //     .doc(id);
  //   await docPlanner.delete();
  //   showSnackbar(
  //     "Work!", "Work!",
  //     const Icon(Icons.close_rounded, color: Colors.red)
  //   );
  // }

  String category = "Latest Tech";
  String title = "Immerse Project SIC Mobile Blog App Mobile Blog App";
  String author = "Jimmy Cool";
  String writtenDate = "14/02/2022";
  String articleImage =
      "https://images.unsplash.com/photo-1542435503-956c469947f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80";
  String userImage =
      "https://images.unsplash.com/photo-1495360010541-f48722b34f7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80";
  String articleContent =
      "Article ini adalah contoh article yang digunakan untuk mengembangkan aplikasi mobile dari SIC Blog. Adapun content dari article ini tidak ada isinya karena ini semua hanya untuk keperluan mengembangkan aplikasi blogapp.";
  String username = "User 1";
  String articleComment = "Article yang bagus!";
  int likeCount = 777;
  int dislikeCount = 123;
  int commentCount = 777;
}
