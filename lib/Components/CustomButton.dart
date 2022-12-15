import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isActive;
  final Function? onChange;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isActive, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isActive) {
          onTap();
        }
        if(onChange != null){
          onChange!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isActive
                  ? [Color(0xffFF7E95), Color(0xffFF1843)]
                  : [
                      Color(0xffF43F5E).withOpacity(0.5),
                      Color(0xffF43F5E).withOpacity(0.5)
                    ]),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
