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
  TextEditingController passC2 = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void register() async {
    if (nameC.text.isNotEmpty && phoneC.text.isNotEmpty && emailC.text.isNotEmpty && passC.text.isNotEmpty && passC2.text.isNotEmpty) {
      if(passC.text == passC2.text){
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
            "profile": null,
            "createdAt": DateTime.now().toIso8601String(),
          });

          Get.offAllNamed(Routes.LOGIN);
          Get.snackbar("Berhasil Registrasi!", "Mohon cek email Anda untuk melakukan verifikasi.");
        } on FirebaseAuthException catch (e) {
          isLoading.value = false;
          if (e.code == 'weak-password') {
            Get.snackbar("Oops!", 'Password yang Anda masukkan terlalu lemah.');
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar("Oops!", 'Email tersebut sudah digunakan.');
          }
          else{
            Get.snackbar("Oops!", e.code);
          }
        } catch (e) {
          isLoading.value = false;
          Get.snackbar("Oops!", e.toString());
        }
      }
      else{
        Get.snackbar("Oops!", "Password yang dimasukkan harus sama");
      }
    } else {
      Get.snackbar("Oops!", "Semua input harus diisi.");
    }
  }
}