import 'package:buahtangan/app/modules/articles/controllers/articles_controller.dart';
import 'package:buahtangan/app/modules/gift-directory/controllers/gift_directory_controller.dart';
import 'package:buahtangan/app/modules/gift-planner/controllers/gift_planner_controller.dart';
import 'package:buahtangan/app/modules/home/controllers/home_result_controller.dart';
import 'package:buahtangan/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeResultController>(
      () => HomeResultController(),
    );
    Get.lazyPut<GiftDirectoryController>(
      () => GiftDirectoryController(),
    );
    Get.lazyPut<ArticlesController>(
      () => ArticlesController(),
    );
    Get.lazyPut<GiftPlannerController>(
      () => GiftPlannerController(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
