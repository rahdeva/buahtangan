import 'package:buahtangan/app/models/planner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GiftPlannerController extends GetxController {
  static GiftPlannerController find = Get.find();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  Stream<List<Planner>> getPlanner() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;

    return FirebaseFirestore.instance
      .collection('planners')
      .doc(uid)
      .collection("plannerData")
      .orderBy("date")
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => Planner.fromJson(doc.data())
        ).toList()
      );
  }
}
