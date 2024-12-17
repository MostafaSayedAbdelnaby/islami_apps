import 'package:flutter/material.dart';

import 'home/home.dart';
import 'on_boarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeNamed: (context) => HomeScreen(),
        HomeScreen.routeNamed: (context) => HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}

/// i'm don't run Splash Screen because Flutter upgrade
/// dart run flutter_native_splash:create --path=C:\Users\Mostafa\AndroidStudioProjects\islamic_app
/// OR
/// to edit the flutter_native_splash.yaml , i'm run the next line that equivalent pub get in pubspec.yaml
/// dart run flutter_native_splash:create.
