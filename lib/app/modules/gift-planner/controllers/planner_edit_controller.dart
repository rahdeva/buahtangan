import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlannerEditController extends GetxController {
  static PlannerEditController find = Get.find();
  TextEditingController testC = TextEditingController();
  late final String id;

  @override
  void onInit() {
    id = Get.arguments["id"];
    super.onInit();
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
    debugPrint(uid);
    final docPlanner = FirebaseFirestore.instance.collection("planners").doc(uid).collection("plannerData").doc();
    debugPrint(docPlanner.id);
    final planner = Planner(
      id: docPlanner.id, 
      createdAt: DateTime.now(), 
      pictureUrl: "https://picsum.photos/500/500", 
      receiver: "Jack Kahuna Laguna", 
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
    await docPlanner.set(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }
}
