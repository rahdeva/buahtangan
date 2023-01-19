import 'package:get/get.dart';

import '../controllers/planner_detail_controller.dart';

class PlannerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannerDetailController>(
      () => PlannerDetailController(),
    );
  }
}
