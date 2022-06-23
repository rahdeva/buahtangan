import 'package:buahtangan/app/routes/app_pages.dart';
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

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getProfile() async {
    try {
      String uid = auth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> docUser = await firestore.collection("users").doc(uid).get();

      return docUser.data();
    } catch (e) {
      print(e);
      Get.snackbar("Oops!", "Tidak dapat get data user.");
      return null;
    }
  }

  void updateProfile() async {
    try {
      isLoading.value = true;
      String uid = auth.currentUser!.uid;
      await firestore.collection("users").doc(uid).update({
        "name": nameC.text,
        "phone": phoneC.text
      });
      isLoading.value = false;
      Get.offNamed(Routes.SETTING);
      Get.snackbar("Berhasil!", "Profil Anda berhasil diperbarui.");
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar("Oops!", "Tidak dapat get data user.");
      return null;
    }
  }
}
