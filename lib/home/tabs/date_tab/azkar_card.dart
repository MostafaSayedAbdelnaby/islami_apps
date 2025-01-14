import 'package:flutter/material.dart';
import 'package:islamic_app/model/radio_model.dart';
import '../../../my_theme_data.dart';

class AzkarCard extends StatelessWidget {
  // final String title;
  // final String imageName;
  final RadioModel radioModel;

  const AzkarCard({required this.radioModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 180,
        padding: EdgeInsets.only(top: 20, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyThemeData.blackColor,
            border: Border.all(
              color: MyThemeData.primaryColor,
              width: 2,
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/${radioModel.imageName}.png",
              height: 120,),
              Text(
                radioModel.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white, fontSize: 20),
              )
            ]),
      ),
    );
  }
}

