import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fodee/Components/CustomButton.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratsScreen extends StatelessWidget {
  final Widget NavigatorPage;
  final String buttonTitle;
  final String description;

  const CongratsScreen(
      {Key? key,
      required this.buttonTitle,
      required this.description, required this.NavigatorPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/image/backgraund.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                SizedBox(
                  height: 180.h,
                  child: Image.asset("assets/image/congrats.png"),
                ),
                24.verticalSpace,
                Text(
                  "Congrats!",
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w600,
                    fontSize: 32.sp,
                    color: Color(0xffF43F5E),
                  ),
                ),
                24.verticalSpace,
                Text(
                  description,
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    color: Color(0xff09101D),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                  child: CustomButton(
                    title: buttonTitle,
                    isActive: true,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NavigatorPage));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
