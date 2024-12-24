import 'package:flutter/material.dart';
import 'package:islamic_app/cache/cache_helper.dart';
import 'package:islamic_app/my_theme_data.dart';
import 'package:islamic_app/sura_details/sura_details.dart';
import 'home/home.dart';
import 'on_boarding_screen.dart';

void main() async {
  /// Safe the next Line when used to async, tell runApp that it works but don't built project Except when Initialized CacheHelper
  /// runApp && CacheHelper.init are works parallel at the same time
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
      initialRoute: CacheHelper.getEligibility() == true
          ? HomeScreen.routeName
          : OnBoardingScreen.routeName,
    );
  }
}

/// i'm don't run Splash Screen because Flutter upgrade
/// dart run flutter_native_splash:create --path=C:\Users\Mostafa\AndroidStudioProjects\islamic_app
/// OR
/// to edit the flutter_native_splash.yaml , i'm run the next line that equivalent pub get in pubspec.yaml
/// dart run flutter_native_splash:create.
