import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/model/sura_model.dart';

// ignore: must_be_immutable
class SuraNameItem extends StatelessWidget {
  final SuraModel model;

  const SuraNameItem({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/sura_number.png",
                color: Colors.white,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "${model.index+1}",
                  style: GoogleFonts.elMessiri(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 24),

          /// Column without Expanded is sets in center of Row , because i'm used to Expanded to put in after number & cross .start
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.nameEn,
                  style: GoogleFonts.elMessiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${model.numOFVerses} Verses",
                  style: GoogleFonts.elMessiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            model.nameAr,
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
