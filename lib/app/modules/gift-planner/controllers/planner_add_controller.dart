import 'package:buahtangan/app/helpers/id_generator.dart';
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

  Future createNewPlanner() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    debugPrint(uid);
    final docPlanner = FirebaseFirestore.instance.collection("planners").doc(uid).collection("plannerData").doc();
    debugPrint(docPlanner.id);
    final planner = Planner(
      id: docPlanner.id, 
      createdAt: DateTime.now(), 
      pictureUrl: "https://picsum.photos/500/500", 
      receiver: "Jack Kahuna Laguna", 
      date: DateTime.now(), 
      event: "Birthday", 
      budget: "100.000-100.000.000", 
      notifDate: DateTime.now(), 
      messages: "Give him a surprise", 
      notes: "He is good surfer", 
      giftSlugs: [
        "test-gift",
        "test-gift2"
      ]
    );

    final json = planner.toJson();
    await docPlanner.set(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
    // try{
      
    // }
    // catch(e){
    //   showSnackbar(
    //     "Terjadi Kesalahan!", e.toString(),
    //     const Icon(Icons.close_rounded, color: Colors.red)
    //   );
    // }
  }
}
