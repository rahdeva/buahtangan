import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt index = 0.obs;
  final CarouselController carouselC = CarouselController();

  final List<Map> data = [
    {
      "image": 'assets/lottie/finder.json',
      "title": "Gift Finder",
      "desc": "Let us find the best gifts for you"
    },
    {
      "image": 'assets/lottie/gifts.json',
      "title": "Gift Directory",
      "desc": "Discover gifts that you might like"
    },
    {
      "image": 'assets/lottie/articles.json',
      "title": "Articles",
      "desc": "Discover things you don't know about"
    },
    {
      "image": 'assets/lottie/calendar.json',
      "title": "Gift Planner",
      "desc": "Be more organized in your gift-giving"
    }
  ];
}
