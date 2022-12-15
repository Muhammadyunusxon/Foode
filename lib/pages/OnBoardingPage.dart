import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fodee/Components/CustomButton.dart';
import 'package:fodee/pages/SignIn_SignUp/SignInPage.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/image/splash_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 700.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff09101D).withOpacity(0),
                      Color(0xff09101D).withOpacity(1),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Foode",
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 33.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    "The best food ordering and delivery app of the century",
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  40.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SignInPage(),
                        ));
                      },
                      title: "Next", isActive: true,
                    ),
                  ),
                  48.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
