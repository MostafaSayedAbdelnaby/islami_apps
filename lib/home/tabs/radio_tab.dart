import 'package:flutter/material.dart';
import 'package:islamic_app/my_theme_data.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30),
          color: Colors.black,
          child: Image.asset(
            "assets/images/islami.png",
            width: double.infinity,
            height: 150,
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => _onButtonPressed(index),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? MyThemeData.primaryColor
                                  : MyThemeData.blackColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              index == 0 ? "Radio" : "Reciters",
                              // style: TextStyle(color: Colors.white),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: _selectedIndex == index
                                        ? MyThemeData.blackColor
                                        : Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(height: 10),
                        // _radioWidget(0),
                        // SizedBox(height: 10),
                        // _radioWidget(1),
                        // SizedBox(height: 10),
                        // _radioWidget(2),
                        // SizedBox(height: 10),
                        // _radioWidget(3),
                        // SizedBox(height: 10),
                        SizedBox(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(height: 10),
                            shrinkWrap: true, // Important for SingleChildScrollView
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: nameOfSheikh.length,
                            itemBuilder: (context, index) {
                              return _radioWidget(index);
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<String> nameOfSheikh = [
    "Ibrahim Al-Akdar",
    "Al-Qaria Yassen",
    "Ahmed Al-trabulsi",
    "Addokali Mohammad Alalim",
  ];

  Widget _radioWidget(int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            "assets/images/Mask mosque.png",
            color: Color(0x33202020),
            alignment: Alignment.bottomCenter,
          ),
        ),
        Column(
          children: [
            Text(
              _selectedIndex==0 ? "Radio ${nameOfSheikh[index]}" : nameOfSheikh[index] ,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  size: 32,
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.play_arrow_rounded,
                  size: 46,
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.volume_up,
                  size: 34,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}