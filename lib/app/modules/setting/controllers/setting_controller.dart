import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  static SettingController find = Get.find();
  TextEditingController searchC = TextEditingController();
  TextEditingController reviewC = TextEditingController();
  String searchKeyword = "";
  double rating = 3;
  int maxLength = 200;
  RxString reviewResult = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  
  XFile? image;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamProfile() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("users").doc(uid).snapshots();
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    String uid = auth.currentUser!.uid;
    // Pick an image
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      Get.snackbar("Berhasil!", "Mohon tunggu sesaat untuk update foto profile");
      
      String ext = image!.name.split(".").last;
      await storage.ref(uid).child("profile.$ext").putFile(File(image!.path));

      String profileUrl = await storage.ref(uid).child("profile.$ext").getDownloadURL();

      await firestore.collection("users").doc(uid).update({"profile": profileUrl});  
    }
  }

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
