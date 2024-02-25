


import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/src/helper/helper_function.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_model.dart';
import 'package:sampoorna_app/src/screens/Authentication/user/user_repo.dart';

class userController extends GetxController{
  static userController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(userRepo());


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value =true;
      final user = await userRepository.fetchUSerDetails();
      this.user(user);

    }catch(e){
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      if(userCredentials!=null)
        {
          final user = UserModel(id: userCredentials.user!.uid,
              name: userCredentials.user!.displayName ?? '',
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              DOB: '',
              gender:  '',
              disability: '',
              profilePicture:userCredentials.user!.photoURL ?? '',
              disabilityCerti:  '',);

          await userRepository.saveUserRecord(user);
        }
    }catch(e)
    {
     warningSnackBar(title: 'Data not saved',
     message: 'Something went wrong while saving your information. you can re save your data in your profile');
    }
  }


}