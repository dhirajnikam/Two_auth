import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:legal/controller/auth/register.dart';
import 'package:legal/view/auth/getstarted.dart';
import 'package:legal/view/auth/phone_verify.dart';
import 'package:legal/view/auth/Register.dart';
import 'package:legal/view/root/root.dart';

class LoginController extends GetxController {
  final _googleSignIn = GoogleSignIn(); //Sign in with google
  GoogleSignInAccount? _account;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isloding = true;
  var linkauthresult; //Linking Google with number
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  bool otpVisibility = false;
  String verificationID = "";

  String? get email {
    return auth.currentUser!.email;
  }

  String? get uid {
    return auth.currentUser!.uid;
  }

  String? get name {
    return auth.currentUser!.displayName;
  }

  String? get Pimg {
    return auth.currentUser!.photoURL;
  }

  String? get phone {
    return auth.currentUser!.phoneNumber;
  }

  //Verifying phone number and sending otp
  void phone_login() async {
    if (phoneController.text.length == 10) {
      auth.verifyPhoneNumber(
        phoneNumber: "+91" + phoneController.text,
        verificationCompleted: (PhoneAuthCredential Pcredential) async {
          await auth.signInWithCredential(Pcredential).then((value) {
            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          otpVisibility = true;
          verificationID = verificationId;
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      Get.snackbar(
        "Phone is correct",
        "True",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (phoneController.text.length == 0) {
      Get.snackbar(
        "Phone number is null",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (phoneController.text.length != 10) {
      Get.snackbar(
        "Phone number is short",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

//Verifying Otp
  void verifyOTP() async {
    if (otpController.text.length == 6) {
      PhoneAuthCredential Pcredential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otpController.text);
      linkauthresult = await auth.currentUser!.linkWithCredential(Pcredential);

      await Get.off(RegDet());
      Get.snackbar(
        "OTP is correct",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Otp has error",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

//Sign in with google
  void login_google() async {
    isloding = false;
    update();
    final googleuser = await _googleSignIn.signIn();
    if (googleuser == null) return;
    _account = googleuser;
    final googleauth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: googleauth.idToken, accessToken: googleauth.accessToken);

    final log = await auth.signInWithCredential(credential);
    if (auth.currentUser!.phoneNumber == null) {
      Get.off(Phone_verfiy());
    } else if (auth.currentUser!.phoneNumber != null) {
      Get.off(RegDet());
    } else {
       CircularProgressIndicator();
    }

    isloding = true;
    update();
  }

//Logout
  void Log_Out_User() async {
    await _googleSignIn.signOut();
    await auth.signOut();
    Get.find<RegisterController>().clearUser();
    await Get.offAll(GetStarted());
  }

  void Log_Out_Lawyer() async {
    await _googleSignIn.signOut();
    await auth.signOut();
    Get.find<RegisterController>().clearLawyer();
    await Get.offAll(GetStarted());
  }
}
