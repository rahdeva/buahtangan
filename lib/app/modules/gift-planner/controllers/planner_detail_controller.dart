import 'package:buahtangan/app/models/avatar.dart';
import 'package:buahtangan/app/models/planner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PlannerDetailController extends GetxController {
  static PlannerDetailController find = Get.find();
  TextEditingController dateC = TextEditingController();
  TextEditingController eventC = TextEditingController();
  TextEditingController budgetC = TextEditingController();
  TextEditingController messagesC = TextEditingController();
  TextEditingController notesC = TextEditingController();
  TextEditingController notifC = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  late final String id;

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
    final docUser = FirebaseFirestore.instance
      .collection('planners')
      .doc(uid)
      .collection("plannerData")
      .doc(id);
    final snapshot = await docUser.get();

    if(snapshot.exists){
      return Planner.fromJson(snapshot.data()!);
    }
    return null;
  }

  void fillDataTextController(Planner planner) {
    dateC.text = DateFormat("dd MMMM yyyy").format(planner.date ?? DateTime.now());
    eventC.text = planner.event ?? "-";
    budgetC.text = planner.budget ?? "-";
    messagesC.text = planner.messages ?? "-";
    notesC.text = planner.notes ?? "-";
    notifC.text = DateFormat("dd MMMM yyyy").format(planner.notifDate ?? DateTime.now());
  }

  Future<List<Avatar>> getAvatars() async {
    final docUser = FirebaseFirestore.instance.collection('avatars').orderBy("id");
    final snapshot = await docUser.get();
    return snapshot.docs.map(
      (doc) => Avatar.fromJson(doc.data())
    ).toList();
  }

  // return GetBuilder<PlannerDetailController>(
  //     builder: (controller) {
  //       return Scaffold(
  //         body: FutureBuilder<List<Avatar>>(
  //           future: controller.getAvatars(),
  //           builder: (context, snapshot) {
  //             if(snapshot.hasData){
  //               final avatarList = snapshot.data!;
  //               return ListView.builder(
  //                 itemCount: avatarList.length,
  //                 itemBuilder: ((context, index) {
  //                   final avatarObj = avatarList[index];
  //                   return Row(
  //                     children: [
  //                       SizedBox(
  //                         height: 100,
  //                         width: 100,
  //                         child: Image.network(
  //                           avatarObj.avatarUrl ?? "-"
  //                         ),
  //                       ),
  //                       Text(
  //                         avatarObj.id.toString(),
  //                       )
  //                     ],
  //                   );
  //                 })
  //               );
  //             }
  //             else{
  //               return const CircularProgressIndicator();
  //             }
  //           },
  //         )
  //       );
  //     }
  //   );
}
