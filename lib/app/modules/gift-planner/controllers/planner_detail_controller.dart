import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PlannerDetailController extends GetxController {
  static PlannerDetailController find = Get.find();
  TextEditingController testC = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }
}
