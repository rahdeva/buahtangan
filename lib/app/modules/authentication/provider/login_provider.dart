import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../widgets/snackbar/show_snackbar.dart';

class LoginProvider {
  // static Future<User?> signInEmailPassword(String email, String password) async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email, 
  //       password: password,
  //     );
  //     return credential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       showSnackbar(
  //         "User Tidak Ditemukan!", "Mohon pastikan kembali data yang Anda masukkan.", 
  //         const Icon(Icons.close_rounded, color: Colors.red)
  //       );
  //     } else if (e.code == 'wrong-password') {
  //       showSnackbar(
  //         "Password Salah!", "Mohon pastikan kembali password yang Anda masukkan.", 
  //         const Icon(Icons.close_rounded, color: Colors.red)
  //       );
  //     }
  //   } catch (e) {
  //     showSnackbar(
  //       "Terjadi Kesalahan", e.toString(), 
  //       const Icon(Icons.close_rounded, color: Colors.red)
  //     );
  //   }
  //   return null;
  // }

  // static Future<bool?> sendPasswordResetEmail (String email) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code.toString() == 'invalid-email') {
  //       showSnackbar(
  //         "Oops!", "Email yang anda masukkan tidak valid.", 
  //         const Icon(Icons.close_rounded, color: Colors.red)
  //       );
  //     } else if (e.code.toString() == 'user-not-found') {
  //       showSnackbar(
  //         "Oops!", "User dengan Email tersebut tidak ditemukan.", 
  //         const Icon(Icons.close_rounded, color: Colors.red)
  //       );
  //     } else {
  //       showSnackbar(
  //         "Oops!", e.toString(), 
  //         const Icon(Icons.close_rounded, color: Colors.red)
  //       );
  //     }
  //   } catch (e) {
  //     showSnackbar(
  //       "Oops!", "Tidak dapat reset password ke Email ini", 
  //       const Icon(Icons.close_rounded, color: Colors.red)
  //     );
  //   }
  //   return null;
  // }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
      
    } on FirebaseAuthException catch (e) {
      showSnackbar(
        "Terjadi Kesalahan!", "Kode Error : ${e.toString()}", 
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    } catch (e) {
      showSnackbar(
        "Terjadi Kesalahan!", "Tidak dapat Login menggunakan Email ini", 
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    }
    return null;
  }

  static Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      showSnackbar(
        "Terjadi Kesalahan!", "Kode Error : ${e.toString()}", 
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    } catch (e) {
      showSnackbar(
        "Terjadi Kesalahan!", "Tidak dapat Login menggunakan Email ini", 
        const Icon(Icons.close_rounded, color: Colors.red)
      );
    }
    return null;
  }
}
