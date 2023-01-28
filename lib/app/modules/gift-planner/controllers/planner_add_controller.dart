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
  TextEditingController receiverC = TextEditingController();
  TextEditingController messagesC = TextEditingController();
  TextEditingController notesC = TextEditingController();
  RxList<String> giftsSlugs = [""].obs;
  RxString avatar = "".obs;
  final dateResult = "Date".obs;
  late DateTime date;
  var eventValue = 'Birthday'.obs;
  var eventItems = [
    'Birthday',
    'Christmas',
    'Valentine',
    'Anniversary',
  ];
  var budgetValue = '100.000'.obs;
  var budgetItems = [
    '0',
    '50.000',
    '100.000',
    '150.000',
    '100.000+',
    '200.000+',
    '300.000+',
    '400.000+',
    '500.000+',
  ];
  var notifValue = '1 day before'.obs;
  var notifItems = [
    'D-Day',
    '1 day before',
    '3 days before',
    '7 days before',
    '14 days before',
    '30 days before',
  ];
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
  
  Future<void> createNewPlanner() async {
    Get.focusScope?.unfocus();
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
      useSafeArea: false,
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    if (
      receiverC.text.isNotEmpty &&
      dateResult.value != "Date" &&
      eventValue.value != "" &&
      budgetValue.value != "" &&
      messagesC.text.isNotEmpty &&
      notesC.text.isNotEmpty &&
      notifValue.value != ""
    ) {
      final docPlanner = FirebaseFirestore.instance
        .collection("planners")
        .doc(uid)
        .collection("plannerData")
        .doc();
      final planner = Planner(
        id: docPlanner.id, 
        createdAt: DateTime.now(), 
        pictureUrl: avatar.value == ""
          ? "https://ui-avatars.com/api/?size=120&name=${receiverC.text}"
          : avatar.value, 
        receiver: receiverC.text, 
        date: date, 
        event: eventValue.value, 
        budget: budgetValue.value, 
        notifDate: DateTime.now(), 
        messages: messagesC.text, 
        notes: notesC.text, 
        giftSlugs: giftsSlugs
      );

      final json = planner.toJson();
      await docPlanner.set(json);
      
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
