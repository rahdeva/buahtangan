import 'package:get/get.dart';

import '../controllers/gift_directory_controller.dart';

class GiftDirectoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftDirectoryController>(
      () => GiftDirectoryController(),
    );
  }
}
