import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sampoorna_app/src/helper/exceptions/firebase_auth_exceptions.dart';
import 'package:sampoorna_app/src/helper/exceptions/firebase_exceptions.dart';
import 'package:sampoorna_app/src/helper/exceptions/format_exceptions.dart';
import 'package:sampoorna_app/src/helper/exceptions/platform_exceptions.dart';
import 'package:sampoorna_app/src/screens/Authentication/verify_email.dart';
import 'package:sampoorna_app/src/screens/Onboarding/OnboardingPage.dart';

import '../first.dart';
import 'login.dart';

class authenticationRepository extends GetxController{
  static authenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final deviceStorage =GetStorage();

  // get authenticated user data
  User? get authUser =>_auth.currentUser;

  @override
  void onReady() {
      FlutterNativeSplash.remove();
      screenRedirect();

  }

  screenRedirect() async{
    final user =_auth.currentUser;
    if(user!=null)
      {
        if(user.emailVerified){
          Get.offAll(()=> first());
        }else
          {
            Get.offAll(()=> verifyEmailScreen(email: _auth.currentUser?.email,));
          }
      }
    else{
      print("hellojwd");
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime')!= true ? Get.offAll(()=> login()) : Get.offAll(()=>OnboardingPage());
    }

  }
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
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
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
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
  Future<void> sendEmailVerification() async{
    try{
      return _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
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
  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
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
  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const login());
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
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