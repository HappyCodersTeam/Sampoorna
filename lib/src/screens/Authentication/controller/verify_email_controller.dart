import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/main.dart';
import 'package:sampoorna_app/src/helper/helper_function.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import 'package:sampoorna_app/src/screens/Authentication/success_screen.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_repo.dart';
import 'package:sampoorna_app/src/screens/Authentication/verify_email.dart';

import '../user/user_model.dart';

class verifyEmailController extends GetxController {
  static verifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  sendEmailVerification() async{
    try{
      await authenticationRepository.instance.sendEmailVerification();
      successSnackBar(title: 'Email sent', message: 'Please Check your inbox and verify your email');
    }
    catch(e){
      errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1),(timer) async{
     await FirebaseAuth.instance.currentUser?.reload();
     final user = FirebaseAuth.instance.currentUser;
     if(user?.emailVerified ?? false)
       {
         timer.cancel();
         Get.off(()=>successScreen());
       }
    });
  }
  checkEmailVerificationStatus() async{
    final currentUser =FirebaseAuth.instance.currentUser;
    if(currentUser !=null && currentUser.emailVerified)
      {
        Get.off(()=>successScreen());
      }
  }
}