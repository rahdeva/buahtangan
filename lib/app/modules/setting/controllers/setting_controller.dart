import 'dart:io';
import 'package:buahtangan/app/models/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  static SettingController find = Get.find();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  TextEditingController searchC = TextEditingController();
  TextEditingController reviewC = TextEditingController();
  String searchKeyword = "";
  double rating = 3;
  int maxLength = 200;
  RxString reviewResult = "".obs;

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  
  XFile? image;

  // Stream<DocumentSnapshot<Map<String, dynamic>>> streamProfile() async* {
  //   String uid = auth.currentUser!.uid;

  //   yield* firestore.collection("users").doc(uid).snapshots();
  // }

  Stream<DocumentSnapshot<UserData>> getProfile() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;

    return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .withConverter<UserData>(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        )
      .snapshots(
        includeMetadataChanges: true,
      );
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
