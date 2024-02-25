import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sampoorna_app/src/constant.dart';
import 'package:sampoorna_app/src/screens/Authentication/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sampoorna_app/src/theme/theme_provider.dart';
import 'package:sampoorna_app/src/screens/first.dart';

class OnboardingPage extends StatefulWidget {
  static const String id = "onboard_screen";
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
   final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDark;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.90,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkTheme ? Ddisable : Lgrey,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            "assets/images/onboardin1.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Heading hjadsfiu1",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Text(
                              "Hello my name is pragati gangwar i am doing great ahiidw ghfj hgdyg g ram ram ji chlo chlyte hain by bye",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),

                            ),
                          )
                        ],
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(context).disabledColor,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: Durations.long1,
                            curve: Curves.linear,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Align buttons evenly
                        children: [
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              child: ElevatedButton(
                                style: ButtonStyle(

                                  backgroundColor: isDarkTheme ? MaterialStateProperty.all<Color>(Dbrown3) : MaterialStateProperty.all<Color>(Lpurple2) ,
                                ),
                                onPressed: () {
                                  Get.to(()=>login());
                                },
                                child: Text(
                                  "Skip",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20), // Add margin between buttons
                          Expanded(
                            child: Container(
                              child: ElevatedButton(

                                onPressed: () {
                                  _pageController.animateToPage(
                                    1,
                                    duration: Durations.long1,
                                    curve: Curves.linear,
                                  );
                                },
                                child: Text(
                                  "Next",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.80,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          30.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkTheme ? Ddisable : Lgrey,
                            shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/onboardin1.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Heading hjadsfiu1",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Text(
                              "description textTheme.headlineLarge textTheme.headlineLarge textTheme.headlineLarge",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                            ),
                          )
                        ],
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(context).disabledColor,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: Durations.long1,
                            curve: Curves.linear,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Align buttons evenly
                        children: [
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: isDarkTheme ? MaterialStateProperty.all<Color>(Dbrown3) : MaterialStateProperty.all<Color>(Lpurple2) ,
                                ),
                                onPressed: () {
                                  Get.to(()=>login());
                                },

                                child: Text(
                                  "Skip",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20), // Add margin between buttons
                          Expanded(
                            child: Container(

                              child: ElevatedButton(

                                onPressed: () {
                                  _pageController.animateToPage(
                                    2,
                                    duration: Durations.long1,
                                    curve: Curves.linear,
                                  );
                                },

                                child: Text(
                                  "Next",

                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.80,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          30.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkTheme ? Ddisable : Lgrey,
                            shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/onboardin1.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Heading hjadsfiu1",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Text(
                              "description textTheme.headlineLarge textTheme.headlineLarge textTheme.headlineLarge",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                            ),
                          )
                        ],
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(context).disabledColor,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: Durations.long1,
                            curve: Curves.linear,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Align buttons evenly
                        children: [
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(

                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: isDarkTheme ? MaterialStateProperty.all<Color>(Dbrown3) : MaterialStateProperty.all<Color>(Lpurple2) ,
                                ),
                                onPressed: () {
                                  Get.to(()=>login());
                                },
                                child: Text(
                                  "Skip",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20), // Add margin between buttons
                          Expanded(
                            child: ElevatedButton(

                              onPressed: () {
                                _pageController.animateToPage(
                                  3,
                                  duration: Durations.long1,
                                  curve: Curves.linear,
                                );
                              },

                              child: Text(
                                "Next",
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),

                    ],
                  ),
                ),
                Container(

                  height: MediaQuery.sizeOf(context).height * 0.80,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(

                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          30.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkTheme ? Ddisable : Lgrey,
                            shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/onboardin1.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Heading hjadsfiu1",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Text(
                              "description textTheme.headlineLarge textTheme.headlineLarge textTheme.headlineLarge",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith( color: isDarkTheme ? Colors.white : Colors.black,),
                            ),
                          )
                        ],
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(context).disabledColor,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: Durations.long1,
                            curve: Curves.linear,
                          );
                        },
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: ElevatedButton(

                            onPressed: () {
                              final storage =GetStorage();
                              storage.write('isFirstTime',false);
                              Get.offAll(login());
                              },
                            child: Text(
                              "Get Started",
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
