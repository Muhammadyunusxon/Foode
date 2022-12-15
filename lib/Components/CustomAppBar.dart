import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Row(
          children: [
            24.horizontalSpace,
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 36.r,
                width: 36.r,
                padding: EdgeInsets.symmetric(
                    vertical: 10.32.r, horizontal: 13.61.r),
                decoration: BoxDecoration(
                  color: Color(0xffF43F5E).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(9.82.r),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffF43F5E).withOpacity(0.7),
                  size: 15.35,
                ),
              ),
            ),
            24.horizontalSpace,
            Text(
              title,
              style: GoogleFonts.sourceSansPro(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
    ;
  }
}
