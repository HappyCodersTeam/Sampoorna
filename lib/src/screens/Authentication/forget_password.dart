import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:sampoorna_app/src/helper/validator.dart';
import 'package:sampoorna_app/src/screens/Authentication/reset_password.dart';
import 'package:sampoorna_app/src/screens/Authentication/verify_email.dart';
import '../../constant.dart';
import 'package:intl/intl.dart';
import '../../theme/theme_provider.dart';
import 'controller/forget_password_controller.dart';

class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({super.key});

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(forgetPasswordController());
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Text("Forget password!",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
            SizedBox(
              height: 20,
            ),
            Text("Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.",style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
            SizedBox(
              height: 40,
            ),
            Form(
              key: controller.forgetPasswordFormKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Enter Email ID',
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' (Required)',
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]
                                )
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: controller.email,
                          validator: TValidator.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'eg. pragatigangwar@gmail.com',
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: Text(
                  "Submit"
              ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
