import 'package:buahtangan/app/models/avatar.dart';
import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PlannerEditController extends GetxController {
  static PlannerEditController find = Get.find();
  TextEditingController receiverC = TextEditingController();
  TextEditingController messagesC = TextEditingController();
  TextEditingController notesC = TextEditingController();
  RxList<String> giftsSlugs = [""].obs;
  RxString avatar = "".obs;
  final dateResult = "Date".obs;
  late DateTime date;
  var eventValue = 'Birthday'.obs;
  var eventItems = [
    'Birthday',
    'Christmas',
    'Valentine',
    'Anniversary',
  ];
  var budgetValue = '100.000'.obs;
  var budgetItems = [
    '0',
    '50.000',
    '100.000',
    '150.000',
    '100.000+',
    '200.000+',
    '300.000+',
    '400.000+',
    '500.000+',
  ];
  var notifValue = '1 day before'.obs;
  var notifItems = [
    'D-Day',
    '1 day before',
    '3 days before',
    '7 days before',
    '14 days before',
    '30 days before',
  ];
  late final Planner planner;
  late final String id;

  @override
  void onInit() {
    planner = Get.arguments["planner"];
    id = planner.id ?? "";
    avatar.value = planner.pictureUrl ?? "";
    receiverC.text = planner.receiver ?? "-";
    date = planner.date ?? DateTime.now();
    dateResult.value = DateFormat("dd MMMM yyyy").format(date);
    eventValue.value = planner.event ?? "-";
    budgetValue.value = planner.budget ?? "-";
    messagesC.text = planner.messages ?? "-";
    notesC.text = planner.notes ?? "-";
    notifValue.value = '1 day before';
    giftsSlugs.value = planner.giftSlugs ?? [""];
    super.onInit();
  }

  Future<List<Avatar>> getAvatars() async {
    final docUser = FirebaseFirestore.instance.collection('avatars').orderBy("id");
    final snapshot = await docUser.get();
    return snapshot.docs.map(
      (doc) => Avatar.fromJson(doc.data())
    ).toList();
  }

  Future updatePlanner() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    final docPlanner = FirebaseFirestore.instance
      .collection("planners")
      .doc(uid)
      .collection("plannerData")
      .doc(id);
    final planner = Planner(
      id: docPlanner.id, 
      createdAt: DateTime.now(), 
      pictureUrl: "https://picsum.photos/500/500", 
      receiver: "Jack Kahuna Update", 
      date: DateTime.now(), 
      event: "Birthday", 
      budget: "100.000-100.000.000", 
      notifDate: DateTime.now(), 
      messages: "Give him a surprise", 
      notes: "He is good surfer", 
      giftSlugs: [
        "test-gift",
        "test-gift2"
      ]
    );

    final json = planner.toJson();
    await docPlanner.update(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }

  Future deletePlanner() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    final docPlanner = FirebaseFirestore.instance
      .collection("planners")
      .doc(uid)
      .collection("plannerData")
      .doc(id);
    await docPlanner.delete();
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }
}
