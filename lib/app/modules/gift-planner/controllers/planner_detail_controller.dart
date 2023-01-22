import 'package:buahtangan/app/models/planner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PlannerDetailController extends GetxController {
  static PlannerDetailController find = Get.find();
  TextEditingController testC = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  late final int id;

  @override
  void onInit() {
    id = Get.arguments['id'];
    super.onInit();
  }

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  Future<Planner?> getPlannerDetail() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    final docUser = FirebaseFirestore.instance.collection('planners').doc(uid);
    final snapshot = await docUser.get();

    if(snapshot.exists){
      return Planner.fromJson(snapshot.data()!);
    }
    return null;
  }
}
