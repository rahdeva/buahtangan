import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GiftDetailController extends GetxController {
  static GiftDetailController find = Get.find();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

}
