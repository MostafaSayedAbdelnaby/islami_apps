import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/hadeth_details/hadeth_details.dart';
import 'package:islamic_app/my_theme_data.dart';

import '../../model/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    loadHadethFile();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/islami.png",
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              // autoPlay: true,
              // autoPlayInterval: Duration(milliseconds: 2),
            ),
            items: ahadethList.map((hadeth) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, HadethDetailsScreen.routeName,
                          arguments: hadeth);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset("assets/images/hadeth_bg.png"),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 28),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  hadeth.title,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: MyThemeData.blackColor,
                                      ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                  margin: EdgeInsets.all(16),
                                  child: Text(
                                    hadeth.content.first,
                                    textAlign: TextAlign.center,
                                    // maxLines related with overflow it's used when the lines is bigger
                                    maxLines: 16,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: MyThemeData.blackColor,
                                          overflow:
                                              TextOverflow.ellipsis, // ...
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  /// then() equivalent (async & await)
  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((file) {
      // I have a first hadeth.
      List<String> ahadeth = file.split("#"); // split between two hadeth.

      for (String data in ahadeth) {
        /// trim() is delete right and left space for lines (first hadeth). trimRight() & trimLeft()
        List<String> lines = data.trim().split("\n");
        String hadethTitle = lines[0];
        lines.removeAt(0);
        List<String> content = lines;
        HadethModel hadethModel =
            HadethModel(title: hadethTitle, content: content);
        ahadethList.add(hadethModel);
      }
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}
