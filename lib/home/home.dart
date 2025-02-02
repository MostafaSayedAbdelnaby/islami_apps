import 'package:flutter/material.dart';
import 'package:islamic_app/home/tabs/ahadeth_tab.dart';
import 'package:islamic_app/home/tabs/date_tab/date_tab.dart';
import 'package:islamic_app/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamic_app/home/tabs/radio_tab.dart';
import 'package:islamic_app/home/tabs/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${getBackGroundImageName()}.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value; // to enable play on a many ImageIcon (tabs)
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: _buildNavItem("quran", 0),
                label: "Quran",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: _buildNavItem("ahadeth", 1),
                label: "Ahadeth",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: _buildNavItem("sebha", 2),
                label: "Tasabeh",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: _buildNavItem("ic_radio", 3),
                label: "Radio",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: _buildNavItem("dates", 4),
                label: "Times",
                backgroundColor: Colors.white),
          ],
        ),
        body: tabs[currentIndex], /// return selectedTab in body
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    DateTab(),
  ];

  String getBackGroundImageName() {
    switch (currentIndex) {
      case 0:
        return "Home_bg";
      case 1:
        return "ahadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      default:
        return "Home_bg";
    }
  }

  Widget _buildNavItem(String imageName, int index) {
    return currentIndex == index
        ? Container(
            // to make container on selected tabBarIcon
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: Color(0x99202020),
            ),
            child: ImageIcon(
              AssetImage("assets/images/$imageName.png"),
              color: Color(0xFF202020),
            ),
          )
        : ImageIcon(
            AssetImage("assets/images/$imageName.png"),
            color: Color(0xFF202020),
          );
  }
}
