import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/home/tabs/quran_tab/sura_item_horizontal.dart';
import 'package:islamic_app/home/tabs/quran_tab/sura_name_item.dart';
import 'package:islamic_app/model/sura_model.dart';

// ignore: must_be_immutable
class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  /// searchController is an Object , it's used to if act an Action on Search of TextField
  /// searchController has another name [listener]
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearch);
  }

  onSearch() {
    SuraModel.searchResult.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in SuraModel.suraNamesEn) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResult.add(data);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /// Eng Hamouda Remove InKWell
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _searchItem(),
          // SuraModel.searchResult.isEmpty && searchController.text.isEmpty
          //     ? SizedBox()
          //     : _suraNameHorizontalLst(),

          if (SuraModel.searchResult.isEmpty &&
              searchController.text.isEmpty) ...[_suraNameHorizontalLst()],

          _suraNameVerticalList(),
        ],
      ),
    );
  }

  Widget _suraNameHorizontalLst() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Most Recently ",
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 8,
                );
              },
              itemBuilder: (context, index) {
                return SuraItemHorizontal(
                  model: SuraModel.getSuraModel(index),
                );
              },
              itemCount: SuraModel.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _suraNameVerticalList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sura Lists ",
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Divider(
                color: Colors.white,
                endIndent: 40,
                indent: 40,
              ),
              itemBuilder: (context, index) {
                return SuraNameItem(
                  model: searchController.text.isNotEmpty
                      ? SuraModel.getSelectedSuraModel(index)
                      : SuraModel.getSuraModel(index),
                );
              },
              itemCount: searchController.text.isNotEmpty
                  ? SuraModel.searchResult.length
                  : SuraModel.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchItem() {
    return Column(
      children: [
        Image(image: AssetImage("assets/images/islami.png")),
        TextField(
          controller: searchController,
          cursorWidth: 3,
          cursorColor: Color(0xFFE2BE7F),
          style: GoogleFonts.elMessiri(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            labelText: "Sura Name",
            labelStyle: GoogleFonts.elMessiri(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: ImageIcon(
              AssetImage("assets/images/ic_pre_search.png"),
              color: Color(0xFFE2BE7F),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFFE2BE7F),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFFE2BE7F),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFFE2BE7F),
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
