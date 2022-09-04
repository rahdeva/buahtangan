import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/authentication/provider/register_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/snackbar/show_snackbar.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHidden2 = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passC2 = TextEditingController();

  void register() async {
    if (nameC.text.isNotEmpty && phoneC.text.isNotEmpty && emailC.text.isNotEmpty && passC.text.isNotEmpty && passC2.text.isNotEmpty) {
      if(passC.text == passC2.text){
        isLoading.value = true;
        final userCredential = await RegisterProvider().emailPasswordRegister(
          emailC.text, passC.text
        );
        if (userCredential != null) {
          final registeredUser = await RegisterProvider().createNewUser(
            userCredential,
            nameC.text, 
            phoneC.text, 
            emailC.text, 
            passC.text
          );
          if (registeredUser == true) {
            Get.toNamed(Routes.LOGIN);
            showSnackbar(
              "Berhasil Registrasi!", "Mohon cek email Anda untuk melakukan verifikasi.",
              const Icon(Icons.check_circle_outline_rounded, color: Colors.green)
            );
          } else {
            Get.back();
            print("fill this later");
          }
        }
        isLoading.value = false;
      }
      else{
        showSnackbar(
          "Oops!", "Password yang dimasukkan harus sama", 
          const Icon(Icons.close_rounded, color: Colors.red)
        );
      }
    } else {
      showSnackbar(
        "Oops!", "Semua input harus diisi.", 
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    }
  }
}