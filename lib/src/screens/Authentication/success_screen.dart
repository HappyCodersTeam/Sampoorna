import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';

import 'login.dart';

class successScreen extends StatefulWidget {
  const successScreen({super.key});

  @override
  State<successScreen> createState() => _successScreenState();
}

class _successScreenState extends State<successScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20,left: 20,bottom: 20,right: 20),
          child: Column(
            children: [
              Image(image: AssetImage("")),
              Text("Your account is successfully created!!",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Text("Welcome to Your Sampoorna: Your Account is Created.",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=> authenticationRepository.instance.screenRedirect() , child: Text(
                    "Continue"
                ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
