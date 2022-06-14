import '../../../themes/color_theme.dart';

import '../../articles/views/articles_view.dart';
import '../../gift-directory/views/gift_directory_view.dart';
import '../../gift-planner/views/gift_planner_view.dart';
import '../../home/views/home_view.dart';
import '../../setting/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                GiftDirectoryView(),
                ArticlesView(),
                GiftPlannerView(),
                SettingView(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  selectedIndex: controller.tabIndex,
                  onTabChange: controller.changeTabIndex,
                  rippleColor: primaryColor,
                  hoverColor: primaryColor,
                  gap: 8,
                  activeColor: onPrimaryColor,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: primaryColor,
                  color: onBackgroundColor,
                  tabs: const [
                    GButton(
                      icon: IconlyLight.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: IconlyLight.folder,
                      text: 'Directory',
                    ),
                    GButton(
                      icon: IconlyLight.paper,
                      text: 'Articles',
                    ),
                    GButton(
                      icon: IconlyLight.calendar,
                      text: 'Planner',
                    ),
                    GButton(
                      icon: IconlyLight.setting,
                      text: 'Setting',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}