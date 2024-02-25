

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sampoorna_app/main.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_model.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import '../../../helper/exceptions/firebase_auth_exceptions.dart';
import '../../../helper/exceptions/firebase_exceptions.dart';
import '../../../helper/exceptions/platform_exceptions.dart';
import 'package:sampoorna_app/src/helper/exceptions/format_exceptions.dart';

class userRepo extends GetxController {
  static userRepo get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

//   function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // function to fetch user details based on user ID
  Future<UserModel> fetchUSerDetails() async {
    try {
      final documentSnapshot = await _db.collection("users").doc(
          authenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      }
      else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

//   function to update user data in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("users").doc(updatedUser.id).update(
          updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

//update any feild in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("users").doc(
          authenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
//   function to removeUser data from firestore
Future<void> removeUserRecord(String userID) async{
  try {
    await _db.collection("users").doc(userID).delete();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}










}