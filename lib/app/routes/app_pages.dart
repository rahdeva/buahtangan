import 'package:get/get.dart';

import '../modules/setting/bindings/about_binding.dart';
import '../modules/setting/views/about_view.dart';
import '../modules/articles/bindings/articles_detail_binding.dart';
import '../modules/articles/views/articles_detail_view.dart';
import '../modules/articles/bindings/articles_binding.dart';
import '../modules/articles/views/articles_view.dart';
import '../modules/authentication/bindings/login_binding.dart';
import '../modules/authentication/bindings/register_binding.dart';
import '../modules/authentication/views/login_view.dart';
import '../modules/authentication/views/register_view.dart';
import '../modules/setting/bindings/change_password_binding.dart';
import '../modules/setting/views/change_password_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/setting/bindings/edit_profil_binding.dart';
import '../modules/setting/views/edit_profil_view.dart';
import '../modules/gift-directory/bindings/gift_detail_binding.dart';
import '../modules/gift-directory/views/gift_detail_view.dart';
import '../modules/gift-directory/bindings/favorites_binding.dart';
import '../modules/gift-directory/bindings/gift_directory_binding.dart';
import '../modules/gift-directory/views/favorites_view.dart';
import '../modules/gift-directory/views/gift_directory_view.dart';
import '../modules/gift-planner/bindings/gift_planner_binding.dart';
import '../modules/gift-planner/views/gift_planner_view.dart';
import '../modules/home/bindings/home_result_binding.dart';
import '../modules/home/views/home_result_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/bindings/splash_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/onboarding/views/splash_view.dart';
import '../modules/gift-planner/bindings/planner_add_people_binding.dart';
import '../modules/gift-planner/views/planner_add_people_view.dart';
import '../modules/gift-planner/bindings/planner_people_detail_binding.dart';
import '../modules/gift-planner/views/planner_people_detail_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.GIFT_DIRECTORY,
      page: () => GiftDirectoryView(),
      binding: GiftDirectoryBinding(),
    ),
    GetPage(
      name: _Paths.GIFT_PLANNER,
      page: () => GiftPlannerView(),
      binding: GiftPlannerBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLES,
      page: () => ArticlesView(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME_RESULT,
      page: () => HomeResultView(),
      binding: HomeResultBinding(),
    ),
    GetPage(
      name: _Paths.GIFT_DETAIL,
      page: () => GiftDetailView(),
      binding: GiftDetailBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLES_DETAIL,
      page: () => ArticlesDetailView(),
      binding: ArticlesDetailBinding(),
    ),
    GetPage(
      name: _Paths.PLANNER_ADD_PEOPLE,
      page: () => PlannerAddPeopleView(),
      binding: PlannerAddPeopleBinding(),
    ),
    GetPage(
      name: _Paths.PLANNER_PEOPLE_DETAIL,
      page: () => PlannerPeopleDetailView(),
      binding: PlannerPeopleDetailBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => EditProfilView(),
      binding: EditProfilBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
