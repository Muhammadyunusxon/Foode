import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fodee/pages/Home/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/bottomNavyBar.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int _currentIndex = 0;
  List<Widget> listOfPage = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  List<String> listOfBottom = [
    "home",
    "order",
    "chat",
    "profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: listOfPage[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavyBar(
            backgroundColor: Colors.white.withOpacity(0.99),
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 12,
            curve: Curves.easeInExpo,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: [
              for (int i = 0; i < listOfBottom.length; i++)
                BottomNavyBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/BottomNav/${listOfBottom[i]}.svg",
                    color: Color(0xffFF4D6E),
                  ),
                  title: Text(
                    "${listOfBottom[i].substring(0, 1).toUpperCase()}${listOfBottom[i].substring(1)}",
                    style: GoogleFonts.sourceSansPro(fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                  activeColor: Color(0xffFF4D6E),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
