import 'package:get/get.dart';

class ChangePasswordController extends GetxController {

}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ResetPasswordController extends GetxController {
//   RxBool isLoading = false.obs;
//   TextEditingController emailC = TextEditingController();

//   FirebaseAuth auth = FirebaseAuth.instance;

//   void errMsg(String msg) {
//     Get.snackbar("TERJADI KESALAHAN", msg);
//   }

//   void reset() async {
//     if (emailC.text.isNotEmpty) {
//       isLoading.value = true;
//       try {
//         await auth.sendPasswordResetEmail(email: emailC.text);

//         isLoading.value = false;
//         Get.back(); // kembali ke login
//         Get.snackbar("BERHASIL", "Kami telah mengirim link untuk reset password ke email kamu.");
//       } on FirebaseAuthException catch (e) {
//         isLoading.value = false;
//         errMsg("${e.code}");
//       } catch (e) {
//         isLoading.value = false;
//         errMsg("Tidak dapat reset password ke email ini.");
//       }
//     } else {
//       errMsg("Email belum diisi.");
//     }
//   }
// }
