import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  static HomeController find = Get.find();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  List<String> events = ['aa', 'bb', 'cc', 'dd', 'ee'];
  List<String> receivers = ['aa', 'bb', 'cc', 'dd', 'ee'];
  List<String> budgets = ['aa', 'bb', 'cc', 'dd', 'ee'];
  String selectedEvent = "Event?";
  String selectedReceiver = "Receiver?";
  String selectedBudget = "Budget?";
  TextEditingController eventC = TextEditingController();
  TextEditingController receiverC = TextEditingController();
  TextEditingController budgetC = TextEditingController();
}
