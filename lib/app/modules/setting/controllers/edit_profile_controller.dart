import 'package:buahtangan/app/models/userData.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../routes/app_pages.dart';

class EditProfileController extends GetxController {
  static EditProfileController find = Get.find();
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHidden2 = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserData?> getProfile() async {
    try {
      String uid = auth.currentUser!.uid;
      final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(uid);
      final snapshot = await docUser.get();
      if(snapshot.exists){
        return UserData.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      Get.snackbar("Oops!", "Tidak dapat get data user.");
      return null;
    }
  }

  void updateProfile() async {
    // if(emailC.text.isNotEmpty && phoneC.text.isNotEmpty){
    //   try {
    //     isLoading.value = true;
    //     String uid = auth.currentUser!.uid;
        
    //     await firestore.collection("users").doc(uid).update({
    //       "name": nameC.text,
    //       "phone": phoneC.text
    //     });
    //     isLoading.value = false;
    //     Get.offNamed(Routes.SETTING);
    //     Get.snackbar("Berhasil!", "Profil Anda berhasil diperbarui.");
    //   } catch (e) {
    //     isLoading.value = false;
    //     print(e);
    //     Get.snackbar(e.toString(), "Tidak dapat get data user.");
    //     return null;
    //   }
    // }
    // else{
    //   Get.snackbar("Oops!", "Mohon isi semua field");
    // }
    
    Get.focusScope?.unfocus();
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
      useSafeArea: false,
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    if(emailC.text.isNotEmpty && phoneC.text.isNotEmpty){
      final docUser = FirebaseFirestore.instance
        .collection("users")
        .doc(uid);
      await docUser.update({
        "name": nameC.text,
        "phone": phoneC.text
      });

      Get.back();
      showSnackbar(
        "Success!",
        "Your profile has been updated",
        const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green
        )
      );
    } else {
      Get.back();
      showSnackbar(
        "Oops!", "All of the input must be filled",
        const Icon(
          Icons.close_rounded, 
          color: Colors.red
        )
      );
    }
  }

  void fillDataTextController(UserData user) {
    nameC.text = user.name ?? "-";
    phoneC.text = user.phone ?? "-";
    emailC.text = user.email ?? "-";
  }
}
