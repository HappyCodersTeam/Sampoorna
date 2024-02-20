import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import 'package:sampoorna_app/src/screens/Authentication/controller/verify_email_controller.dart';
import 'package:sampoorna_app/src/screens/Authentication/success_screen.dart';

import '../../constant.dart';
import '../../theme/theme_provider.dart';
import 'login.dart';

class verifyEmailScreen extends StatelessWidget {
  const verifyEmailScreen({super.key, this.email});
    final String? email;
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(verifyEmailController());

    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => authenticationRepository.instance.logout(), icon: Icon(
            Icons.clear
          ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image(image: AssetImage("")),
              Text("Verify your email address!",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Text(email ??'',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Text("Congratulations! Your Account Awaits: Verify Your Email",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.checkEmailVerificationStatus(), child: Text(
                  "Continue"
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
                  onPressed: () =>controller.sendEmailVerification(), child: Text(
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
