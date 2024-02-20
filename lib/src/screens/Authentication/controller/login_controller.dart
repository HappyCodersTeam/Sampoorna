import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sampoorna_app/main.dart';
import 'package:sampoorna_app/src/helper/helper_function.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_repo.dart';
import 'package:sampoorna_app/src/screens/Authentication/verify_email.dart';

import '../user/user_model.dart';

class loginController extends GetxController{
  final localStorage = GetStorage();
  final email =TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> emailAndPasswordSignIn() async{
    try{
      if(!loginFormKey.currentState!.validate())
        {
          return;
        }
      final userCredentials = await authenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    authenticationRepository.instance.screenRedirect();
    } catch(e){
      errorSnackBar(title: 'Error', message: e.toString());
    }
  }

}