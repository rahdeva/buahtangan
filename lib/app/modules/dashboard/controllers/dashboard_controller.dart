import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/utils.dart';
import '../../../modules/articles/views/articles_view.dart';
import '../../../modules/gift-directory/views/gift_directory_view.dart';
import '../../../modules/gift-planner/views/gift_planner_view.dart';
import '../../../modules/home/views/home_view.dart';
import '../../../modules/setting/views/setting_view.dart';

class DashboardController extends GetxController {
  static DashboardController find = Get.find();
  var tabIndex = 0;
  
  void changeNavBar(int index) {
    Utils.loadNavBarBinding(index);
    tabIndex = index;
    update(['nav-bar', 'bottom-nav-bar']);
  }

  List<Widget> tabView = const [
    HomeView(),
    GiftDirectoryView(),
    ArticlesView(),
    GiftPlannerView(),
    SettingView()
  ];
    
}
