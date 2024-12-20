import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// This function can tell us if it saw any action. {it can saw and it can't saw}
  static safeEligibility() {
    prefs.setBool("onBoarding", true);
  }

  static bool? getEligibility(){
    return prefs.getBool("onBoarding");
  }
}
