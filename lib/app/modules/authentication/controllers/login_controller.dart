import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool rememberme = false.obs;
  RxBool isHidden = true.obs;
  TextEditingController emailC = TextEditingController(text: "wirandanaputra@gmail.com");
  TextEditingController passwordC = TextEditingController(text: "admin123");

  FirebaseAuth auth = FirebaseAuth.instance;

  final box = GetStorage();

  void login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

        isLoading.value = false;

        if (userCredential.user!.emailVerified == true) {
          if (box.read("rememberme") != null) {
            await box.remove("rememberme");
          }
          if (rememberme.isTrue) {
            await box.write("rememberme", {
              "email": emailC.text,
              "pass": passwordC.text,
            });
          }
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.defaultDialog(
            title: "Belum Tervefirikasi",
            middleText: "Apakah kamu ingin mengirim email verifikasi kembali ?",
            actions: [
              OutlinedButton(
                onPressed: () => Get.back(), // menutup dialog
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // kirim ulang email verifikasi
                    await userCredential.user!.sendEmailVerification();
                    Get.back(); // tutup dialog
                    print("BERHASIL MENGIRIM EMAIL VERIFIKASI");
                    Get.snackbar("BERHASIL", "Kami telah mengirimkan email verifikasi. Buka email kamu untuk tahap verifikasi.");
                  } catch (e) {
                    print(e);
                    Get.back(); // tutup dialog
                    Get.snackbar("Error!", "Kamu terlalu banyak meminta kirim email verifikasi.");
                  }
                },
                child: Text("KIRIM LAGI"),
              ),
            ],
          );
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print(e.code);
        Get.snackbar("Error!", e.code);
      }
    } else {
      Get.snackbar("Error!", "Email & password harus diisi.");
    }
  }

}