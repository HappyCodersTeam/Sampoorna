import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:sampoorna_app/src/screens/Authentication/verify_email.dart';
import '../../constant.dart';
import 'package:intl/intl.dart';
import '../../theme/theme_provider.dart';
import 'controller/forget_password_controller.dart';
import 'login.dart';

class resetPasswordScreen extends StatelessWidget {
  const resetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(
              Icons.clear
          ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image(image: AssetImage(""),
              width: (MediaQuery.of(Get.context!).size.width)*0.6,),
              SizedBox(
                height: 20,
              ),
        Text(email,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
        SizedBox(
          height: 20,),
              Text("Password Reset Email Sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Text("Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.offAll(()=> login()), child: Text(
                    "Done"
                ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Adjust the border radius here
                        side: BorderSide(color:isDarkTheme ? Dcream : Lpurple1, width: 2.0), // Specify border color and width
                      ),
                    ),
                  ),
                  onPressed: () {
                    forgetPasswordController.instance.resendPasswordResetEmail(email);
                  }, child: Text(
                    "Resend Email"
                ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
