import 'package:get/get.dart';

import '../controllers/home_result_controller.dart';

class HomeResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeResultController>(
      () => HomeResultController(),
    );
  }
}
