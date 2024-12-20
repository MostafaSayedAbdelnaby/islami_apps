import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/model/sura_model.dart';

// ignore: must_be_immutable
class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index + 1);
    }
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFE2BE7F)),
        backgroundColor: Color(0xFF202020),
        centerTitle: true,
        title: Text(
          model.nameEn,
          style: GoogleFonts.elMessiri(
            color: Color(0xFFE2BE7F),
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/Mask left.png"),
                Text(
                  model.nameAr,
                  style: GoogleFonts.elMessiri(
                    color: Color(0xFFE2BE7F),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset("assets/images/Mask right.png"),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFFE2BE7F),
                        ),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                /// gets Ayat Al Quran
                                text: verses[index],
                                style: GoogleFonts.aBeeZee(
                                  color: Color(0xFFE2BE7F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                  children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/sura_number.png",
                                        color: Colors.white,
                                        height: 30,
                                      ),
                                      // The text span for the Ayat number
                                      Text(
                                        "${index + 1}",
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        // textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                              ),

                              // TextSpan(
                              //   /// gets number of Ayat Al Quran
                              //   text: "(${index + 1})",
                              //   style: GoogleFonts.aBeeZee(
                              //     color: Colors.white,
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Image.asset("assets/images/Mask mosque.png"),
    );
  }

  loadSuraFile(int index) async {
    String file = await rootBundle.loadString("assets/files/$index.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
