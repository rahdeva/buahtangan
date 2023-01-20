import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController find = Get.find();
  RxBool isLoading = false.obs;
  RxBool isHidden1 = true.obs;
  RxBool isHidden2 = true.obs;
  RxBool isHidden3 = true.obs;
  TextEditingController curentPassC = TextEditingController();
  TextEditingController newPassC = TextEditingController();
  TextEditingController confirmNewPassC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePassword() async {
    if (newPassC.text.isNotEmpty && confirmNewPassC.text.isNotEmpty) {
      if (newPassC.text == confirmNewPassC.text) {
        try {
          isLoading.value = true;
          await auth.currentUser!.updatePassword(newPassC.text);
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
