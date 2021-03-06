import 'package:flutter/cupertino.dart';
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Stream<DocumentSnapshot<Map<String, dynamic>>> streamProfile() async* {
//     String uid = auth.currentUser!.uid;

//     yield* await firestore.collection("users").doc(uid).snapshots();
//   }

//   Stream<QuerySnapshot<Map<String, dynamic>>> streamNotes() async* {
//     String uid = auth.currentUser!.uid;

//     yield* await firestore.collection("users").doc(uid).collection("notes").orderBy("createdAt", descending: true).snapshots();
//   }

//   void deleteNote(String docID) async {
//     try {
//       String uid = auth.currentUser!.uid;
//       await firestore.collection("users").doc(uid).collection("notes").doc(docID).delete();
//     } catch (e) {
//       Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menghapus note.");
//     }
//   }
// }
