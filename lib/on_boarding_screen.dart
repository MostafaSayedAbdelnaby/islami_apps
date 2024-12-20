import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamic_app/home/home.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

// import 'home.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = "/";

  const OnBoardingScreen({super.key});

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = GoogleFonts.elMessiri(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFE2BE7F),
    );
    var pageDecoration = PageDecoration(
      imageFlex: 3,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: Color(0xFFE2BE7F),
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFF202020),
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/islami.png"),
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        color: Color(0xFF707070),
        activeColor: Color(0xFFFFD482),
      ),
      globalBackgroundColor: Color(0xFF202020),
      showDoneButton: true,
      next: Text(
        "Next",
        style: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE2BE7F),
        ),
      ),
      showNextButton: true,
      done: Text(
        "Done",
        style: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE2BE7F),
        ),
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeNamed);
      },
      showSkipButton: true,
      skip: Text(
        "Skip",
        style: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE2BE7F),
        ),
      ),
      // showBackButton: true,
      // back: Text(
      //   "Back",
      //   style: GoogleFonts.elMessiri(
      //     fontSize: 18,
      //     fontWeight: FontWeight.bold,
      //     color: Color(0xFFE2BE7F),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage('onboarding_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi",
          body: "We Are Very Excited To Have You In Our Community.",
          image: _buildImage('onboarding_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran.",
          body: " Read, and your Lord is the Most Generous.",
          image: _buildImage('onboarding_3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High.",
          image: _buildImage('onboarding_4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('onboarding_5.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
