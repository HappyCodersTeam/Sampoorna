
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/src/helper/helper_function.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import 'package:sampoorna_app/src/screens/Authentication/reset_password.dart';


import '../user/user_model.dart';


class forgetPasswordController extends GetxController {

  static forgetPasswordController get instance => Get.find();
  final email =TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  sendPasswordResetEmail() async {
    try{
      if(!forgetPasswordFormKey.currentState!.validate())
        {
          return;
        }
      await authenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      successSnackBar(title: 'Email Sent', message: 'Link is sent to reset your password');
      Get.to(()=>resetPasswordScreen(email: email.text.trim()));
    }catch(e){
      errorSnackBar(title: 'Error', message: e.toString());
    }
  }
  resendPasswordResetEmail(String email) async {
    try{
      await authenticationRepository.instance.sendPasswordResetEmail(email);
      successSnackBar(title: 'Email Sent', message: 'Link is sent to reset your password');

    }catch(e){
      errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}