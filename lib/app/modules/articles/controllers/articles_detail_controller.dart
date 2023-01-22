import 'package:buahtangan/app/models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlesDetailController extends GetxController {
  static ArticlesDetailController find = Get.find();
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
    final docUser = FirebaseFirestore.instance.collection('articles').doc(slug);
    final snapshot = await docUser.get();

    if(snapshot.exists){
      return Article.fromJson(snapshot.data()!);
    }
  }
}
