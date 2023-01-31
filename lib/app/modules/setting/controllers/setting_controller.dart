import 'dart:io';
import 'package:buahtangan/app/models/feedback.dart';
import 'package:buahtangan/app/models/userData.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:flutter/material.dart';
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

  Future<void> addFeedback() async {
    Get.focusScope?.unfocus();
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
      useSafeArea: false,
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    if (reviewResult.value.isNotEmpty) {
      final docFeedback = FirebaseFirestore.instance
        .collection("feedbacks")
        .doc();
      final feeedback = UserFeedback(
        id: docFeedback.id,
        userName: auth.currentUser!.displayName, 
        createdAt: DateTime.now(), 
        feedback: reviewResult.value, 
        rating: rating
      );

      final json = feeedback.toJson();
      await docFeedback.set(json);
      
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
}
