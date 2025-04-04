import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamiapp/ui/homescreen/home_screen.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = 'OnboardingScreens';

  void goToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          buildPage("assets/images/intro1.png"),
          buildPage("assets/images/intro2.png"),
          buildPage("assets/images/intro3.png"),
          buildPage("assets/images/intro4.png"),
          buildPage("assets/images/intro5.png"),
        ],
        showBackButton: true,
        back: Container(
          margin: const EdgeInsets.only(right: 50.0),
          child: const Text(
            "Back",
            style: TextStyle(fontSize: 18, color: Color(0xFFE2BE7F)),
          ),
        ),
        next: Container(
          margin: const EdgeInsets.only(left: 55.0),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 18, color: Color(0xFFE2BE7F)),
          ),
        ),
        done: Container(
          margin: const EdgeInsets.only(left: 45.0),
          child: const Text(
            "Finish",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE2BE7F)),
          ),
        ),
        onDone: () => goToHomeScreen(context),
        onSkip: () => goToHomeScreen(context),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color(0xFFE2BE7F),
          color: Colors.grey,
          spacing: const EdgeInsets.symmetric(horizontal: 4.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  PageViewModel buildPage(String imagePath) {
    return PageViewModel(
      title: "",
      body: "",
      image: Container(
        constraints: BoxConstraints.expand(),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
      decoration: PageDecoration(
        fullScreen: true,
        bodyFlex: 0,
        imageFlex: 1,
      ),
    );
  }
}
