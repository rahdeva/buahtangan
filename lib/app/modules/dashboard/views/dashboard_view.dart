import 'package:buahtangan/app/widgets/bottom-navigation/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        id: 'nav-bar',
        init: controller,
        builder: (_) {
          return controller.tabView[controller.tabIndex];
        },
      ),
      bottomNavigationBar: GetBuilder(
        id: 'bottom-nav-bar',
        init: controller,
        builder: (_) {
          return BottomNavBarWidget(controller: controller);
        },
      ),
    );
  }
}