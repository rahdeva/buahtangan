import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
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
  TextEditingController currentPassC = TextEditingController();
  TextEditingController newPassC = TextEditingController();
  TextEditingController confirmNewPassC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePassword() async {
    var user = FirebaseAuth.instance.currentUser!;
    if (currentPassC.text.isNotEmpty && newPassC.text.isNotEmpty && confirmNewPassC.text.isNotEmpty) {
      if (newPassC.text == confirmNewPassC.text) {
        var validate = await validatePassword(currentPassC.text);
        if(validate == true){
          // try {
          //   isLoading.value = true;
          //   await user.updatePassword(newPassC.text);
          //   isLoading.value = false;
          //   Get.offAllNamed(Routes.SETTING);
          //   showSnackbar(
          //     "Success!", "Your password has been changed",
          //     const Icon(Icons.check_circle_outline_rounded, color: Colors.green)
          //   );
          // } catch (e) {
          //   isLoading.value = false;
          //   showSnackbar(
          //     e.toString(), "Your current password is not correct",
          //     const Icon(Icons.close_rounded, color: Colors.red)
          //   );
          // }
          isLoading.value = true;
          await user.updatePassword(newPassC.text);
          isLoading.value = false;
          Get.offAllNamed(Routes.SETTING);
          showSnackbar(
            "Success!", "Your password has been changed",
            const Icon(Icons.check_circle_outline_rounded, color: Colors.green)
          );
        }
        else{
          showSnackbar(
            "Oops!", "Your current password is not correct",
            const Icon(Icons.close_rounded, color: Colors.red)
          );
        }
      }
      else{
        showSnackbar(
          "Oops!", "The password doesn't match! Enter the same password",
          const Icon(Icons.close_rounded, color: Colors.red)
        );
      }
    } else {
      showSnackbar(
        "Oops!", "All of the input must be filled",
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    }
  }
  
  Future<bool> validatePassword(String password) async {
    var user = FirebaseAuth.instance.currentUser!;
    var authCredentials = EmailAuthProvider.credential(
      email: user.email!, 
      password: password
    );
    try {
      var authResult = await user.reauthenticateWithCredential(
        authCredentials
      );
      return authResult.user != null;
    } catch (e) {
      return false;
    }
  }
}
