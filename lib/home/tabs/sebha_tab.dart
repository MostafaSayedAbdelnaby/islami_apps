import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sebha",style: GoogleFonts.elMessiri(color: Colors.white,fontSize: 24,),),
        ],
      ),
    );
  }
}
