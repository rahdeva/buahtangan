import 'package:buahtangan/app/models/userData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../widgets/snackbar/show_snackbar.dart';

class RegisterProvider extends GetConnect {
  Future<UserCredential?> emailPasswordRegister(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();
      return userCredential;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(
          "Password terlalu lemah!", "Mohon gunakan password yang lebih kuat.",
          const Icon(Icons.close_rounded, color: Colors.red)
        );
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(
          "Email sudah digunakan!", "Mohon gunakan email yang lain.",
          const Icon(Icons.close_rounded, color: Colors.red)
        );
      } else {
        showSnackbar(
          "Terjadi Kesalahan!", e.toString(),
          const Icon(Icons.close_rounded, color: Colors.red)
        );
      }
    } catch (e) {
      showSnackbar(
        "Terjadi Kesalahan!", e.toString(),
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    }
    return null;
  }

  Future<bool?> createNewUser(userCredential, name, phone, email, password) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try{
      final docUser = firestore.collection("users").doc(userCredential.user!.uid);
      final user = UserData(
        uid: userCredential.user!.uid, 
        createdAt: DateTime.now(), 
        name: name, 
        email: email, 
        phone: phone, 
        profile: "https://ui-avatars.com/api/?size=120&name=$name", 
        articleLiked: [], 
        giftFavourited: [], 
        giftLiked: [],
      );

      final json = user.toJson();
      await docUser.set(json);
      return true;
    }
    catch(e){
      showSnackbar(
        "Terjadi Kesalahan!", e.toString(),
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    }
    return false;
  }
}