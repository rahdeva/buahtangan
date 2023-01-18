import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController {
  TextEditingController searchC = TextEditingController();

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
