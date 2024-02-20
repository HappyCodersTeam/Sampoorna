import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_model.dart';

import '../../../helper/exceptions/firebase_auth_exceptions.dart';
import '../../../helper/exceptions/firebase_exceptions.dart';
import '../../../helper/exceptions/platform_exceptions.dart';
import 'package:sampoorna_app/src/helper/exceptions/format_exceptions.dart';

class userRepo extends GetxController {
  static userRepo get instance =>Get.find();
  final FirebaseFirestore _db =FirebaseFirestore.instance;

//   function to save user data to firestore
Future<void> saveUserRecord(UserModel user) async{
  try{
    await _db.collection("users").doc(user.id).set(user.toJson());
  } on FirebaseException catch (e){
  throw TFirebaseException(e.code).message;
  } on FormatException catch(_){
  throw const TFormatException();
  } on PlatformException catch(e){
  throw TPlatformException(e.code).message;
  } catch(e){
  throw 'Something went wrong. Please try again';
  }

}
}