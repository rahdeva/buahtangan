import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController find = Get.find();
  RxInt index = 0.obs;
  final CarouselController carouselC = CarouselController();

  final List<Map> data = [
    {
      "id":1,
      "image": 'assets/lottie/finder.json',
      "title": "Gift Finder",
      "desc": "Let us find the best gifts for you"
    },
    {
      "id": 2,
      "image": 'assets/lottie/gift.json',
      "title": "Gift Directory",
      "desc": "Discover gifts that you might like"
    },
    {
      "id": 3,
      "image": 'assets/lottie/articles.json',
      "title": "Articles",
      "desc": "Discover things you don't know about"
    },
    {
      "id": 4,
      "image": 'assets/lottie/calendar.json',
      "title": "Gift Planner",
      "desc": "Be more organized in your gift-giving"
    },
  ];
}
