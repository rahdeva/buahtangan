import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    print("asas");
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
