import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden1 = true.obs;
  RxBool isHidden2 = true.obs;
  TextEditingController passNewC = TextEditingController();
  TextEditingController passConfirmC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePassword() async {
    if (passNewC.text.isNotEmpty && passConfirmC.text.isNotEmpty) {
      if (passNewC.text == passConfirmC.text) {
        try {
          isLoading.value = true;
          await auth.currentUser!.updatePassword(passNewC.text);
          isLoading.value = false;
          Get.offAllNamed(Routes.SETTING);
          Get.snackbar("Berhasil!", "Password Anda telah berhasil diganti.");
        } catch (e) {
          isLoading.value = false;
          Get.snackbar("Oops!", "Tidak dapat update password.");
        }
      }
      else{
        Get.snackbar("Oops!", "Mohon perhatikan kembali password yang Anda masukkan.");
      }
    } else {
      Get.snackbar("Oops!", "Semua field harus diisi.");
    }
  }
}
