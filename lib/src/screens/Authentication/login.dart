import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sampoorna_app/src/helper/validator.dart';
import 'package:sampoorna_app/src/screens/Authentication/controller/login_controller.dart';
import 'package:sampoorna_app/src/screens/Authentication/forget_password.dart';
import 'package:sampoorna_app/src/screens/Authentication/signup.dart';

import '../../constant.dart';
import '../../theme/theme_provider.dart';

class login extends StatefulWidget {
  static const String id = "login_screen";
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(loginController());
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDark;
    bool isPasswordVisible = true;
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme()),
            ), // Place the toggle button in the app bar
          ],
        ),
        body: SafeArea(
          child: Column(

            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        "Login to your account",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Text(
                        "Welcome to Sampoorna",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 22,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.loginFormKey,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 15),
                                              child: Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text: 'Enter Mobile No./Email ID',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: ' (Required)',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .copyWith(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ])),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: controller.email,
                                            validator: (value)=> TValidator.validateEmail(value),
                                            keyboardType: TextInputType.name,
                                            textAlign: TextAlign.left,
                                            onChanged: (value) {
                                              //Do something with the user input.
                                              // name = value;
                                            },
                                            decoration: InputDecoration(
                                              hintText:
                                                  'enter your mobile no. or email id',
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 15),
                                              child: Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text: 'Enter Password',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' (Required)',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .copyWith(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ])),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: controller.password,
                                            validator: (value) => TValidator.validateEmptyText('Password',value),
                                            keyboardType: TextInputType.visiblePassword,
                                            obscureText: isPasswordVisible,
                                            textAlign: TextAlign.left,
                                            onChanged: (value) {
                                              //Do something with the user input.
                                              // password = value;
                                            },
                                            decoration: InputDecoration(
                                              suffix: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isPasswordVisible =
                                                    !isPasswordVisible;
                                                  });
                                                },
                                                child: isPasswordVisible
                                                    ? Text(
                                                  'Show',
                                                  style: TextStyle(
                                                    color: isDarkTheme
                                                        ? Dcream
                                                        : Lpurple1,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                )
                                                    : Text(
                                                  'Hide',
                                                  style: TextStyle(
                                                    color: isDarkTheme
                                                        ? Dcream
                                                        : Lpurple1,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              hintText: 'Enter the password',
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    TextButton(
                                        onPressed: ()=> Get.to(()=>forgotPasswordScreen()),
                                        child: Text(
                                          "Forgot Password?",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 80,),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.emailAndPasswordSignIn();
                                    // Navigator.pushNamed(context, first.id);
                                  }, // Remove shadow if not needed
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20,bottom: 20, top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
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
                                        Get.to(signup());
                                        // Navigator.pushNamed(context, signup().id);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "Register Now",
                                          style:
                                              Theme.of(context).textTheme.titleMedium,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
