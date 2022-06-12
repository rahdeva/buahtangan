import 'package:get/get.dart';

import '../controllers/gift_planner_controller.dart';

class GiftPlannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftPlannerController>(
      () => GiftPlannerController(),
    );
  }
}
