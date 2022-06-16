import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHidden2 = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void register() async {
    if (nameC.text.isNotEmpty && phoneC.text.isNotEmpty && emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );

        print(userCredential);

        isLoading.value = false;

        // kirim link email verifikasi
        await userCredential.user!.sendEmailVerification();

        await firestore.collection("users").doc(userCredential.user!.uid).set({
          "name": nameC.text,
          "phone": phoneC.text,
          "email": emailC.text,
          "uid": userCredential.user!.uid,
          "createdAt": DateTime.now().toIso8601String(),
        });

        Get.offAllNamed(Routes.LOGIN);
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print(e.code);
        Get.snackbar("TERJADI KESALAHAN", e.code);
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", e.toString());
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua input harus diisi.");
    }
  }
}