import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../theme/theme_provider.dart';


class first extends StatefulWidget {
  static const String id = "first";
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Theme Toggle'),
            actions: [
              Switch(value: notifier.isDark, onChanged: (value)=>notifier.changeTheme()), // Place the toggle button in the app bar
            ],
          ),
          body:
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Adjust the border radius here
                      side: BorderSide(color: Lpurple1, width: 2.0), // Specify border color and width
                    ),
                  ),
                ),
                onPressed: () {

                }, child: Text(
                  "Resend Email"
              ),
              ),
          ),
        );
      }
    );
  }
}
