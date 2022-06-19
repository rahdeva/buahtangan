import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt index = 0.obs;
  final CarouselController carouselC = CarouselController();

  final List<Map> data = [
    {
      "image": 'assets/lottie/finder.json',
      "title": "title",
      "desc": "desc"
    },
    {
      "image": 'assets/lottie/gifts.json',
      "title": "title",
      "desc": "desc"
    },
    {
      "image": 'assets/lottie/articles.json',
      "title": "title",
      "desc": "desc"
    },
    {
      "image": 'assets/lottie/calendar.json',
      "title": "title",
      "desc": "desc"
    }
  ];
}
