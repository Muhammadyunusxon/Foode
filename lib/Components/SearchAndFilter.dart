import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAndFilter extends StatelessWidget {
  final Function onChanged;
  final Function onTapFilter;
  const SearchAndFilter({Key? key, required this.onChanged, required this.onTapFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4 * 3,
          child: TextFormField(
            onChanged: (text){
              onChanged();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF4F6F9),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 12.h, horizontal: 26.w),
                child: SvgPicture.asset(
                  "assets/svg/Search.svg",
                  color: Color(0xff858C94),
                ),
              ),
              hintText: "Search",
              hintStyle: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff09101D).withOpacity(0.8),
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 12.h, horizontal: 28.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            onTapFilter();
          },
          child: Container(
              height: 44.r,
              width: 44.r,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xffF43F5E).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(9.82.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Color(0xff5A6CEA).withOpacity(0.08),
                    )
                  ]),
              child: SvgPicture.asset(
                "assets/svg/filter.svg",
                height: 24.r,
                width: 24.r,
                color: Color(0xffF43F5E),
              )),
        ),
      ],
    );
  }
}
