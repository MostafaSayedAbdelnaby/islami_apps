import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraItemHorizontal extends StatelessWidget {
  final String name;

  const SuraItemHorizontal({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    name,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF202020),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Image.asset("assets/images/sura_item_horizontal.png"),
            ],
          ),
        ],
      ),
    );
  }
}
