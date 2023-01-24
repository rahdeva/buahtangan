import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlannerAddController extends GetxController {
  static PlannerAddController find = Get.find();
  TextEditingController nameC = TextEditingController();
  TextEditingController messagesC = TextEditingController();
  TextEditingController notesC = TextEditingController();
  TextEditingController testC = TextEditingController();

  // void register() async {
  //   if (nameC.text.isNotEmpty && phoneC.text.isNotEmpty && emailC.text.isNotEmpty && passC.text.isNotEmpty && passC2.text.isNotEmpty) {
  //     if(passC.text == passC2.text){
  //       isLoading.value = true;
  //       final userCredential = await RegisterProvider().emailPasswordRegister(
  //         emailC.text, passC.text
  //       );
  //       if (userCredential != null) {
  //         final registeredUser = await RegisterProvider().createNewUser(
  //           userCredential,
  //           nameC.text, 
  //           phoneC.text, 
  //           emailC.text, 
  //           passC.text
  //         );
  //         if (registeredUser == true) {
  //           Get.toNamed(Routes.LOGIN);
  //           showSnackbar(
  //             "Berhasil Registrasi!", "Mohon cek email Anda untuk melakukan verifikasi.",
  //             const Icon(Icons.check_circle_outline_rounded, color: Colors.green)
  //           );
  //         } else {
  //           Get.back();
  //           print("fill this later");
  //         }
  //       }
  //       isLoading.value = false;
  //     }
  //     else{
  //       showSnackbar(
  //         "Oops!", "Password yang dimasukkan harus sama", 
  //         const Icon(Icons.close_rounded, color: Colors.red)
  //       );
  //     }
  //   } else {
  //     showSnackbar(
  //       "Oops!", "Semua input harus diisi.", 
  //       const Icon(Icons.close_rounded, color: Colors.red)
  //     );
  //   }
  // }

  void createNewPlanner() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    PlannerData planner = PlannerData(
      id: 2, 
      createdAt: DateTime.now(), 
      pictureUrl: "https://picsum.photos/500/500", 
      receiver: "Jack Kahuna Laguna", 
      date: DateTime.now(), 
      event: "Birthday", 
      budget: "100.000-100.000.000", 
      notifDate: DateTime.now(), 
      messages: "Give him a surprise", 
      notes: "He is good surfer", 
      giftSlugs: []
    );
    // try{
    //   await FirebaseFirestore.instance.collection("planners").doc(uid).update({
    //     "plannerData": FieldValue.arrayUnion(planner.toJson())
    //   });
    // }
    // catch(e){
    //   showSnackbar(
    //     "Terjadi Kesalahan!", e.toString(),
    //     const Icon(Icons.close_rounded, color: Colors.red)
    //   );
    // }
  }
}
