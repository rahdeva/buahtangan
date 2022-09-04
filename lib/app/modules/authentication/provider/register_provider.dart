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
      await firestore.collection("users").doc(userCredential.user!.uid).set({
        "name": name,
        "phone": phone,
        "email": email,
        "uid": userCredential.user!.uid,
        "profile": null,
        "createdAt": DateTime.now().toIso8601String(),
      });
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