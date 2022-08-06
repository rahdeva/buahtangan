import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
