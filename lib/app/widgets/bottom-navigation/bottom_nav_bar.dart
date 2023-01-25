import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import '../../modules/dashboard/controllers/dashboard_controller.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key,required this.controller}) : super(key: key);
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: GNav(
        selectedIndex: controller.tabIndex,
        onTabChange: (index) => controller.changeNavBar(index),
        gap: 4,
        hoverColor: primaryColor,
        activeColor: onPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        tabMargin: const EdgeInsets.symmetric(vertical: 10.0),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: primaryColor,
        color: onBackgroundColor,
        tabs: [
          GButton(
            icon: IconlyLight.home,
            text: 'Home',
            textStyle: projectTextTheme.overline?.copyWith(color: onPrimaryColor),
          ),
          GButton(
            icon: IconlyLight.folder,
            text: 'Directory',
            textStyle: projectTextTheme.overline?.copyWith(color: onPrimaryColor),
          ),
          GButton(
            icon: IconlyLight.paper,
            text: 'Article',
            textStyle: projectTextTheme.overline?.copyWith(color: onPrimaryColor),
          ),
          GButton(
            icon: IconlyLight.calendar,
            text: 'Planner',
            textStyle: projectTextTheme.overline?.copyWith(color: onPrimaryColor),
          ),
          GButton(
            icon: IconlyLight.setting,
            text: 'Setting',
            textStyle: projectTextTheme.overline?.copyWith(color: onPrimaryColor),
          ),
        ],
      ),
    );
  }
}
