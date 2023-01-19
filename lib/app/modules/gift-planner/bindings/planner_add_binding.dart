import 'package:get/get.dart';

import '../controllers/planner_add_controller.dart';

class PlannerAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannerAddController>(
      () => PlannerAddController(),
    );
  }
}
