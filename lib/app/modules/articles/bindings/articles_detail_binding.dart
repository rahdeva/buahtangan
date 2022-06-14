import 'package:get/get.dart';

import '../controllers/articles_detail_controller.dart';

class ArticlesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticlesDetailController>(
      () => ArticlesDetailController(),
    );
  }
}
