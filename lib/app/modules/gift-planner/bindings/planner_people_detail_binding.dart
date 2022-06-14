import 'package:get/get.dart';

import '../controllers/planner_people_detail_controller.dart';

class PlannerPeopleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannerPeopleDetailController>(
      () => PlannerPeopleDetailController(),
    );
  }
}
