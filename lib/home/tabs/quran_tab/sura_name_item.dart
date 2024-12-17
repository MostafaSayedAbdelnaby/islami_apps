import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SuraNameItem extends StatelessWidget {
  int index;
  String name;

  SuraNameItem({required this.index, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/sura_number.png",
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "$index",
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Text(
          name,
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
