import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int counter = 0;
  double turns = 0;
  int index =0;
  List<String> zekr = ["سبحان الله", "الحمدلله", "الله اكبر"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(alignment: Alignment.center,"assets/images/islami.png"),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20,left: 34),
                    child: Image.asset(
                      alignment: Alignment.center,
                      "assets/images/tasbeh_header.png",
                    ),
                ),
                GestureDetector(
                  onTap: (){
                    index++;
                    if(index==34){
                      counter=counter+1;
                      index=0;
                      if(counter==3){
                        counter=0;
                      }
                    }
                    setState(() => turns += 1.0 / 30);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedRotation(
                        duration: Duration(milliseconds: 500),
                        turns: turns,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/tasbeh_bg.png"),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(zekr[counter]
                            , style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("$index", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}