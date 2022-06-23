import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHidden2 = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passC2 = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:myfirebase/app/routes/app_pages.dart';

// class ProfileController extends GetxController {
//   TextEditingController emailC = TextEditingController();
//   TextEditingController nameC = TextEditingController();
//   TextEditingController phoneC = TextEditingController();

//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   void logout() async {
//     try {
//       await auth.signOut();
//       Get.offAllNamed(Routes.LOGIN);
//     } catch (e) {
//       print(e);
//       Get.snackbar("TERJADI KESALAHAN", "Tidak dapat logout.");
//     }
//   }

//   Future<Map<String, dynamic>?> getProfile() async {
//     try {
//       String uid = auth.currentUser!.uid;
//       DocumentSnapshot<Map<String, dynamic>> docUser = await firestore.collection("users").doc(uid).get();

//       return docUser.data();
//     } catch (e) {
//       print(e);
//       Get.snackbar("TERJADI KESALAHAN", "Tidak dapat get data user.");
//     }
//   }
// }
