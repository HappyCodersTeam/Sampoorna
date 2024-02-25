
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import '../component/shimmer.dart';
import 'Authentication/controller/user_controller.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  void logOutPopup()
  {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(18),
      title: 'Logout',
      middleText: 'Are you sure you want to logout from your account?',
      content: Container( // Wrap the dialog content in a Container
        width: 200, // Set your desired width here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to logout from your account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Spacing between text and buttons
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(Get.overlayContext!).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () => authenticationRepository.instance.logout(),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    minimumSize: Size(100, 40),
                    backgroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Logout'),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
    // Get.defaultDialog(
    //   contentPadding: const EdgeInsets.all(18),
    //   title: 'Logout',
    //   middleText: ''
    //       'Are you sure you want to logout from your account?',
    //   confirm: ElevatedButton(onPressed: () => authenticationRepository.instance.logout(),
    //       style: ElevatedButton.styleFrom(textStyle: TextStyle(
    //         fontSize: 15,
    //         fontWeight: FontWeight.normal,
    //       ),
    //           minimumSize: Size(100, 40),
    //           backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
    //       child: Padding(
    //         padding:EdgeInsets.symmetric( horizontal: 8),
    //         child: Text('Logout'),
    //       ),
    //   ),
    //   cancel: OutlinedButton(onPressed: (){
    //     Navigator.of(Get.overlayContext!).pop();
    //     },
    //       child: Text('Cancel'))
    // );
  }
  // Widget buildHeader(BuildContext context) =>
  Widget buildMenuItems(BuildContext context) => Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        )
    ),
    padding: EdgeInsets.all(24),
    child: Wrap(

      runSpacing: 16,
      children: [
        ListTile(
          leading: Icon(Icons.account_circle_rounded),
          title: Text('My Profile'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text('About App'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.info_rounded),
          title: Text('Information for People with Disability'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.logout_rounded),
          title: Text('Logout'),
          onTap: (){
            logOutPopup();
          },
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(userController());
    var width = MediaQuery.of(context).size.width;
    return  Drawer(
      width: width*0.93,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        Material
        (
        color: Theme.of(context).primaryColor,
        child: InkWell
          (
          onTap: (){},
          child: Container(

            padding: EdgeInsets.only(
              top: 24+MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(
                    "assets/images/onboardin1.png",
                  ),),
                SizedBox(height: 12,),
                Obx(() {
                  if (controller.profileLoading.value) {
                    return const TshimerEffect(width: 80, height: 15);
                  }
                  else {
                    return Text('${controller.user.value.name}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(

                      ),);
                  }
                }),
                Obx(() {
                  if (controller.profileLoading.value) {
                    return const TshimerEffect(width: 80, height: 15);
                  }
                  else {
                    return Text('${controller.user.value.email}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(

                      ),);
                  }
                }),


              ],
            ),
          ),
        ),
      ),
            buildMenuItems(context),
          ],
        ),
      ),
    );



  }
}
