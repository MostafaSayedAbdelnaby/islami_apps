import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model/sura_model.dart';

class SuraItemHorizontal extends StatelessWidget {
  final SuraModel model;

  const SuraItemHorizontal({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                model.nameEn,
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF202020),
                ),
              ),
              Text(
                model.nameAr,
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF202020),
                ),
              ),
              Text(
                "${model.numOFVerses} \tVerses",
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF202020),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Image.asset("assets/images/sura_item_horizontal.png"),
        ],
      ),
    );
  }
}
