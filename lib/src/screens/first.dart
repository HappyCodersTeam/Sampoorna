import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:sampoorna_app/src/screens/community/chat_home.dart';
import 'package:sampoorna_app/src/screens/menu.dart';
import 'package:shake/shake.dart';
import '../component/bottomBar.dart';
import '../component/shimmer.dart';
import '../constant.dart';
import '../theme/theme_provider.dart';
import 'package:sampoorna_app/src/screens/SOS/sos_contacts.dart';

import 'Authentication/controller/user_controller.dart';
import 'SOS/add_conatacts.dart';
import 'SOS/contact_model.dart';
import 'SOS/db_services.dart';

class first extends StatefulWidget {
  static const String id = "first";
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  var height, width;
  Position? _curentPosition;
  String? _curentAddress;
  LocationPermission? permission;
  List imgData = [

  ];
  List titles = [
  "Report and Recommendation",
  "Community",
  "Medicare",
   "Connect Me",
   "Services",
   "Feed"

  ];
  _getPermission() async => await [Permission.sms].request();
  _isPermissionGranted() async => await Permission.sms.status.isGranted;
  _sendSms(String phoneNumber, String message, {int? simSlot}) async {
    SmsStatus result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber, message: message, simSlot: 1);
    if (result == SmsStatus.sent) {
      print("Sent");
      Fluttertoast.showToast(msg: "send");
    } else {
      Fluttertoast.showToast(msg: "failed");
    }
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "Location permissions are  denind");
      if (permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
        Fluttertoast.showToast(
            msg: "Location permissions are permanently denind");
      }
    }
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _curentPosition = position;
        print(_curentPosition!.latitude);
        _getAddressFromLatLon();
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  _getAddressFromLatLon() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _curentPosition!.latitude, _curentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _curentAddress =
        "${place.locality},${place.subLocality},${place.street},${place.postalCode},${place.country}";
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  getAndSendSms() async {
    List<TContact> contactList = await DatabaseHelper().getContactList();
    String messageBody =
        "https://maps.google.com/?daddr=${_curentPosition!.latitude},${_curentPosition!.longitude}";
    if (await _isPermissionGranted()) {
      contactList.forEach((element) {
        _sendSms("${element.number}", "i am in trouble $messageBody");
      });
    } else {
      Fluttertoast.showToast(msg: "something wrong");
    }
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _getPermission();
    _getCurrentLocation();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        getAndSendSms();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shake!'),
          ),
        );
        // Do stuff on phone shake
      },
      minimumShakeCount: 4,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDark;
    final controller = Get.put(userController());
    return  Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {

        return Scaffold(
            key: _scaffoldKey,
          drawer: MenuDrawer(),
          body:
          Container(
            color: Theme.of(context).primaryColor,
            height: height,
            width: width,
            child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                    ),
                      width: width,
                      height: height *0.27,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 45.0, left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.menu,
                                    size: 40,),
                                  onPressed: () {
                                    _scaffoldKey.currentState?.openDrawer(); // This line opens the drawer.
                                  },
                                ),
                                // InkWell(
                                //   onTap: (){
                                //     Get.to(MenuDrawer());
                                //   },
                                //   child: Icon(
                                //     Icons.menu,
                                //
                                //   ),
                                // ),
                                Switch( activeColor: Dcream, value: notifier.isDark, onChanged: (value)=>notifier.changeTheme()),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 30,right: 20),
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               Obx(() {
                                 if(controller.profileLoading.value)
                                   {
                                     return const TshimerEffect(width:80, height:15);
                                   }
                                 else{
                                   return Text("Hello, ${controller.user.value.name}!",
                                       textAlign: TextAlign.left,
                                       style: Theme
                                           .of(context)
                                           .textTheme
                                           .headlineMedium!
                                           .copyWith(
                                         color: isDarkTheme ? Dcream : Lcream,
                                       )
                                   );
                                 }

                               }),
                                SizedBox(height: 5,),
                                Text("Welcome to SAMPOORNA - Together, let's redefine accessibility for a world without limits. Ready, set, thrive!",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: isDarkTheme ? Dcream : Lcream,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),


                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDarkTheme ?dashboard :Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )
                      ),
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15, top: 0),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                            (crossAxisCount: 2,
                            childAspectRatio: (1.12/ 0.9) ,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 1,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context,index) {
                            return InkWell(
                              onTap: (){
    switch (index) {
      case 0:
      // Navigate to Report and Recommendation Page
      //   Get.to(() => ReportAndRecommendationPage());
        break;
      case 1:
      // Navigate to Community Page
        Get.to(() => chatHome());
        break;
      case 2:
      // Navigate to Medicare Page
      //   Get.to(() => MedicarePage());
        break;
      case 3:
      // Navigate to Connect Me Page
      //   Get.to(() => ConnectMePage());
        break;
      case 4:
      // Navigate to Services Page
      //   Get.to(() => ServicesPage());
        break;
      case 5:
      // Navigate to Feed Page
      //   Get.to(() => FeedPage());
        break;
      default:
      // Handle any undefined index
        Fluttertoast.showToast(msg: "This page is under construction");
        break;
    } },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: isDarkTheme ? Dcream : Lpurple1,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0.3,
                                      blurRadius: 1,
                                    )
                                  ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                          // Image.asset(imgData[index]),
                                          // Text(titles[index],),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )


                    ),
                  ),

                ],
              ),
          ),
          floatingActionButton: FloatingActionButton.large(
            backgroundColor:  Colors.red.shade400,
            shape: CircleBorder(),
            onPressed: () {
              Get.to(()=>AddContactsPage());
            },
            child: Icon(Icons.sos_rounded,
              size: 48,
              color: Dbrown1,

            ),
            elevation: 2.0,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBar()

          // appBar: AppBar(
          //   title: Text('Theme Toggle'),
          //   actions: [
          //     Switch(value: notifier.isDark, onChanged: (value)=>notifier.changeTheme()), // Place the toggle button in the app bar
          //   ],
          // ),
          // body:
          //   Column(
          //     children: [
          //       SizedBox(
          //         width: double.infinity,
          //         child: TextButton(
          //           style: ButtonStyle(
          //             backgroundColor: MaterialStateProperty.all(Colors.transparent),
          //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20.0), // Adjust the border radius here
          //                 side: BorderSide(color: Lpurple1, width: 2.0), // Specify border color and width
          //               ),
          //             ),
          //           ),
          //           onPressed: () {
          //               Get.to(()=>AddContactsPage());
          //           }, child: Text(
          //             "Resend Email"
          //         ),
          //         ),
          //                 ),
          //       SizedBox(
          //         width: double.infinity,
          //         child: TextButton(
          //           style: ButtonStyle(
          //             backgroundColor: MaterialStateProperty.all(Colors.transparent),
          //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20.0), // Adjust the border radius here
          //                 side: BorderSide(color: Lpurple1, width: 2.0), // Specify border color and width
          //               ),
          //             ),
          //           ),
          //           onPressed: () {
          //             Get.to(()=>chatHome());
          //           }, child: Text(
          //             "chat"
          //         ),
          //         ),
          //       ),
          //     ],
          //   ),
                );
      }
    );
  }
}
