import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamic_app/cache/cache_helper.dart';
import 'package:islamic_app/home/home.dart';


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
      color: Theme.of(context).primaryColor,
    );
    var pageDecoration = PageDecoration(
      imageFlex: 3,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
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
        /// because primaryColor: primaryColor, in my_theme
        activeColor: Theme.of(context).primaryColor,

      ),
      globalBackgroundColor: Color(0xFF202020),
      showDoneButton: true,
      next: Text(
        "Next",
        style: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      showNextButton: true,
      done: Text(
        "Done",
        style: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        /// If this page opens once, it will not open again until I close the project and Run
        CacheHelper.safeEligibility();
      },
      showSkipButton: true,
      skip: Text(
        "Skip",
        style: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
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
