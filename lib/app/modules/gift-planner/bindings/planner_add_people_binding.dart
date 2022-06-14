import 'package:get/get.dart';

import '../controllers/planner_add_people_controller.dart';

class PlannerAddPeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannerAddPeopleController>(
      () => PlannerAddPeopleController(),
    );
  }
}
