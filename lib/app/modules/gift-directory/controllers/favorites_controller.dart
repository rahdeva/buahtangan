import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoritesController extends GetxController {
  static FavoritesController find = Get.find();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }
}
