import 'package:flutter/material.dart';
import 'package:get/get.dart';

successSnackBar({required title, message = '', duration =3})
{
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: Colors.white,
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: duration),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Icons.warning_amber, color: Colors.white,),
  );
}
warningSnackBar({required title, message = ''})
{
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: Colors.white,
    backgroundColor: Colors.orange,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Icons.warning_amber, color: Colors.white,),
  );
}
 errorSnackBar({required title, message = ''})
{
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: Colors.white,
    backgroundColor: Colors.red.shade600,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Icons.warning_amber, color: Colors.white,),
  );
}
