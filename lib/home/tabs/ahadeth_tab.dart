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
