import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // s.FirebaseStorage storage = s.FirebaseStorage.instance;

  void logout() async {
    try {
      await auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
      Get.snackbar("TERJADI KESALAHAN", "Tidak dapat logout.");
    }
  }
}

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:myfirebase/app/routes/app_pages.dart';
// import 'package:firebase_storage/firebase_storage.dart' as s;

// class ProfileController extends GetxController {
//   RxBool isLoading = false.obs;
//   RxBool isHidden = true.obs;
//   RxBool profile = false.obs;
//   TextEditingController emailC = TextEditingController();
//   TextEditingController nameC = TextEditingController();
//   TextEditingController phoneC = TextEditingController();
//   TextEditingController passC = TextEditingController();



//   XFile? image;

//   void pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     // Pick an image
//     image = await _picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       update();
//     }
//   }

//   void resetImage() {
//     image = null;
//     update();
//   }

//   void clearProfile() async {
//     try {
//       String uid = auth.currentUser!.uid;
//       await firestore.collection("users").doc(uid).update({
//         "profile": FieldValue.delete(),
//       });

//       Get.back();
//       profile.value = false;
//       update();
//     } catch (e) {
//       print(e);
//       Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menghapus profile.");
//     }
//   }

//   

//   Future<Map<String, dynamic>?> getProfile() async {
//     try {
//       String uid = auth.currentUser!.uid;
//       DocumentSnapshot<Map<String, dynamic>> docUser = await firestore.collection("users").doc(uid).get();

//       profile.value = true;
//       return docUser.data();
//     } catch (e) {
//       print(e);
//       Get.snackbar("TERJADI KESALAHAN", "Tidak dapat get data user.");
//       return null;
//     }
//   }

//   void updateProfile() async {
//     if (emailC.text.isNotEmpty && nameC.text.isNotEmpty && phoneC.text.isNotEmpty) {
//       try {
//         isLoading.value = true;
//         String uid = auth.currentUser!.uid;
//         await firestore.collection("users").doc(uid).update({
//           "name": nameC.text,
//           "phone": phoneC.text,
//         });

//         if (image != null) {
//           String ext = image!.name.split(".").last;
//           await storage.ref("$uid").child("profile.$ext").putFile(File(image!.path));

//           String profileUrl = await storage.ref("$uid").child("profile.$ext").getDownloadURL();

//           await firestore.collection("users").doc(uid).update({"profile": profileUrl});
//         }

//         if (passC.text.isNotEmpty) {
//           // update password
//           await auth.currentUser!.updatePassword(passC.text);
//           await auth.signOut();

//           isLoading.value = false;

//           Get.offAllNamed(Routes.LOGIN);
//         } else {
//           isLoading.value = false;
//         }
//       } catch (e) {
//         isLoading.value = false;
//         print(e);
//         Get.snackbar("TERJADI KESALAHAN", "Tidak dapat edit data user.");
//       }
//     } else {
//       Get.snackbar("TERJADI KESALAHAN", "Email, nama, dan nomor telepon harus diisi.");
//     }
//   }
// }
