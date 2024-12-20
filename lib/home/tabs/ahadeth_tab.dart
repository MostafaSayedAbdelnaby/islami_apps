import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ahadeth",style: GoogleFonts.elMessiri(color: Colors.white,fontSize: 24,),),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class MyThem {
//   static const Color primaryColor = Color(0xffE2BE7F);
//
//   static const Color blackColor = Color(0xff202020);
//
//   static ThemeData lightMode = ThemeData(
//     primaryColor: primaryColor,
//     scaffoldBackgroundColor: Colors.transparent,
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.black,
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: primaryColor,
//       ),
//       titleTextStyle: TextStyle(
//         color: primaryColor,
//         fontSize: 20,
//         fontWeight: FontWeight.w700,
//       ),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       showUnselectedLabels: false,
//       backgroundColor: primaryColor,
//       showSelectedLabels: true,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: blackColor,
//       type: BottomNavigationBarType.fixed,
//     ),
//     textTheme: const TextTheme(
//       titleSmall: TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//       titleMedium: TextStyle(
//         color: MyThem.primaryColor,
//         fontSize: 24,
//         fontWeight: FontWeight.w700,
//       ),
//       titleLarge: TextStyle(
//         color: MyThem.primaryColor,
//         fontSize: 32,
//         fontWeight: FontWeight.w700,
//       ),
//       bodySmall: TextStyle(
//         color: MyThem.primaryColor,
//         fontSize: 16,
//         fontWeight: FontWeight.w700,
//       ),
//     ),
//   );
//
//   static ThemeData darkMode = ThemeData();
// }