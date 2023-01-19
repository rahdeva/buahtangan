import 'package:get/get.dart';

import '../controllers/planner_edit_controller.dart';

class PlannerEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannerEditController>(
      () => PlannerEditController(),
    );
  }
}
