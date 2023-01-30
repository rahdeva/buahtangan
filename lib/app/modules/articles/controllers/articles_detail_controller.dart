import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlesDetailController extends GetxController {
  static ArticlesDetailController find = Get.find();
  RxString commentFilled = "".obs;
  TextEditingController commentC = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  late final String slug;

  @override
  void onInit() {
    slug = Get.arguments["slug"];
    getArticleDetail();
    super.onInit();
  }

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  Future<Article?> getArticleDetail() async {
    final docArticle = FirebaseFirestore.instance.collection('articles').doc(slug);
    final snapshot = await docArticle.get();

    if(snapshot.exists){
      return Article.fromJson(snapshot.data()!);
    }
    return null;
  }

  void addComment() async {
    Get.focusScope?.unfocus();
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
      useSafeArea: false,
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    String name = auth.currentUser!.displayName ?? "";
    if (commentC.text.isNotEmpty) {
      final docComment = FirebaseFirestore.instance.collection('articles').doc(slug);
      final comment = Comment(
        userName: name, 
        comment: commentC.text, 
        date: DateTime.now()
      );

      final json = comment.toJson();
      await docComment.update(
        {'comments': FieldValue.arrayUnion([json])}
      );
      
      Get.back();
      showSnackbar(
        "Success!",
        "Your profile has been updated",
        const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green
        )
      );
    } else {
      Get.back();
      showSnackbar(
        "Oops!", "All of the input must be filled",
        const Icon(
          Icons.close_rounded, 
          color: Colors.red
        )
      );
    }
  }
}
