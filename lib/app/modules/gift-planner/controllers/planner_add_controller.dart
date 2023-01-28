import 'package:buahtangan/app/models/avatar.dart';
import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as s;

class PlannerAddController extends GetxController {
  static PlannerAddController find = Get.find();
  TextEditingController nameC = TextEditingController();
  TextEditingController messagesC = TextEditingController();
  TextEditingController notesC = TextEditingController();
  TextEditingController testC = TextEditingController();
  RxString avatar = "".obs;
  final dateResult = "Date".obs;
  late DateTime date;
  // XFile? image;

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

  Future<List<Avatar>> getAvatars() async {
    final docUser = FirebaseFirestore.instance.collection('avatars').orderBy("id");
    final snapshot = await docUser.get();
    return snapshot.docs.map(
      (doc) => Avatar.fromJson(doc.data())
    ).toList();
  }

  Future pickDate(BuildContext context) async {
    Get.focusScope?.unfocus();
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return;
    date = newDate;
    dateResult.value = DateFormat("dd MMMM yyyy").format(date);
  }
  

  // void pickImage() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   s.FirebaseStorage storage = s.FirebaseStorage.instance;
  //   final ImagePicker picker = ImagePicker();
  //   String uid = auth.currentUser!.uid;
  //   // Pick an image
  //   image = await picker.pickImage(source: ImageSource.gallery);

  //   if (image != null) {
  //     Get.snackbar("Berhasil!", "Mohon tunggu sesaat untuk update foto profile");
      
  //     String ext = image!.name.split(".").last;
  //     await storage.ref(uid).child("profile.$ext").putFile(File(image!.path));

  //     String profileUrl = await storage.ref(uid).child("profile.$ext").getDownloadURL();

  //     await FirebaseFirestore.instance.collection("users").doc(uid).update({"profile": profileUrl});  
  //   }
  // }
}
