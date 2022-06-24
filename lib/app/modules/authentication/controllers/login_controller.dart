import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool rememberme = false.obs;
  RxBool isHidden = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController emailResetC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  final box = GetStorage();

  void loginEmail() async {
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
          Get.offAllNamed(Routes.SETTING);
        } else {
          Get.defaultDialog(
            title: "Belum Tervefirikasi",
            middleText:
                "Apakah kamu ingin mengirim email verifikasi kembali ? Mohon cek juga pada bagian spam",
            actions: [
              OutlinedButton(
                onPressed: () => Get.back(), // menutup dialog
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // kirim ulang email verifikasi
                    await userCredential.user!.sendEmailVerification();
                    Get.back(); // tutup dialog
                    print("BERHASIL MENGIRIM EMAIL VERIFIKASI");
                    Get.snackbar("BERHASIL",
                        "Kami telah mengirimkan email verifikasi. Buka email kamu untuk tahap verifikasi.");
                  } catch (e) {
                    print(e);
                    Get.back(); // tutup dialog
                    Get.snackbar("Oops!",
                        "Kamu terlalu banyak meminta kirim email verifikasi.");
                  }
                },
                child: const Text("KIRIM LAGI"),
              ),
            ],
          );
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'user-not-found') {
          Get.snackbar(
              "Oops!", "Tidak ditemukan User dengan Email yang Anda masukkan.");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Oops!", "Password yang Anda masukkan salah.");
        } else {
          Get.snackbar("Oops!", e.code);
        }
      }
    } else {
      Get.snackbar("Oops!", "Email & password harus diisi.");
    }
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential);
    if (userCredential != null) {
      Get.toNamed(Routes.SETTING);
    }
  }

  void resetDialog() {
    Get.defaultDialog(
      title: "Reset Password",
      titleStyle:
          projectTextTheme.headline6?.copyWith(color: onBackgroundColor),
      titlePadding: const EdgeInsets.only(top: 40),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              boxShadow: [dropShadow()],
            ),
            child: TextField(
              style: projectTextTheme.subtitle1,
              controller: emailResetC,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Your Email...",
                  hoverColor: surfaceColor,
                  fillColor: surfaceColor,
                  focusColor: primaryColor,
                  isDense: true,
                  filled: true,
                  contentPadding: const EdgeInsets.all(20),
                  labelStyle: projectTextTheme.subtitle1
                      ?.copyWith(color: onSurfaceColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primaryColor, width: 0.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: surfaceColor, width: 0.0))),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: Get.width,
            height: 60,
            decoration: shadowDecoration(),
            child: ElevatedButton(
              onPressed: () => reset(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                overlayColor: MaterialStateProperty.all(primaryVariantColor),
                foregroundColor: MaterialStateProperty.all(onPrimaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              child: Text(
                "Reset Password",
                style: projectTextTheme.button,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: Get.width,
            height: 60,
            decoration: shadowDecoration(),
            child: OutlinedButton(
              onPressed: () => Get.back(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                overlayColor: MaterialStateProperty.all(surfaceColor),
                foregroundColor: MaterialStateProperty.all(secondaryColor),
                side: MaterialStateProperty.all(
                    BorderSide(color: secondaryColor)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              child: Text(
                "Cancel",
                style: projectTextTheme.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void reset() async {
    if (emailResetC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailResetC.text);

        isLoading.value = false;
        Get.back();
        Get.snackbar("Berhasil!",
            "Kami telah mengirimkan link untuk reset password pada Email Anda.");
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code.toString() == 'invalid-email') {
          Get.snackbar("Oops!", 'Email yang anda masukkan tidak valid.');
        } else if (e.code.toString() == 'user-not-found') {
          Get.snackbar("Oops!", 'User dengan Email tersebut tidak ditemukan.');
        } else {
          Get.snackbar("Oops!", e.code);
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("Oops!", "Tidak dapat reset password ke Email ini.");
      }
    } else {
      Get.snackbar("Oops!", "Email belum diisi.");
    }
  }
}
