
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampoorna_app/src/constant.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import '../screens/Authentication/controller/user_controller.dart';
import '../theme/theme_provider.dart';
class TshimerEffect extends StatelessWidget {
  const TshimerEffect({Key? key,
  required this.width,
  required this.height,
  this.radius =15,
  this.color,}) : super(key: key);
  final double width, height,radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDark;
    return Shimmer.fromColors(
         baseColor: isDarkTheme ? Dcream : Lpurple1,
      highlightColor:isDarkTheme ? Dcream : Lpurple1,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color?? (isDarkTheme ? Dcream : Lpurple1),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
    );
  }
}
