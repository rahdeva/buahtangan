import 'package:get/get.dart';

import '../controllers/gift_detail_controller.dart';

class GiftDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftDetailController>(
      () => GiftDetailController(),
    );
  }
}
