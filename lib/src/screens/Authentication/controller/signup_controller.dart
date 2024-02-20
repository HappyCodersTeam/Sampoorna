import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/main.dart';
import 'package:sampoorna_app/src/helper/helper_function.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_repo.dart';
import 'package:sampoorna_app/src/screens/Authentication/verify_email.dart';

import '../user/user_model.dart';


class signupController extends GetxController {
  static signupController get instance => Get.find();
  final email =TextEditingController();
  final name =TextEditingController();
  final password =TextEditingController();
  final phone =TextEditingController();
  final date =TextEditingController();
  GlobalKey<FormState> signupFormKey =GlobalKey<FormState>();

void signup() async{
  try{
    if(!signupFormKey.currentState!.validate()) return;

    //   register user in the firbase authentication and save user data in firebase
   final userCredential = await authenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

  //   save authenticated user data in the firebase firestore
    final newUser = UserModel(
      id: userCredential.user!.uid,
      name: name.text.trim(),
      email: email.text.trim(),
      phoneNumber: phone.text.trim(),
      DOB: '',
      gender: '',
      disability: '',
      disabilityCerti: '',
      profilePicture: '',
    );
    final UserRep = Get.put(userRepo());
   await UserRep.saveUserRecord(newUser);

   successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify your email to continue');
    Get.to(()=> verifyEmailScreen(email: email.text.trim(),));
  } catch(e){
    errorSnackBar(title: 'Error', message: e.toString());
  }
    // form validation

  }
}