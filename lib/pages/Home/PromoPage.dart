import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/CustomAppBar.dart';
import '../../Model/PromoModel.dart';
class PromoPage extends StatefulWidget {
  final List<PromoModel> listOfPromo;
  const PromoPage({Key? key, required this.listOfPromo}) : super(key: key);

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Popular Restaurant"),
            6.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: widget.listOfPromo.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 24.w, vertical: 20.h),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 32.w),
                      height: 180.h,
                      width: MediaQuery.of(context).size.width - 44,
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 22,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.centerRight,
                              colors: [
                                ...widget.listOfPromo[index].backgroundColor,
                              ])),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 166.w,
                            child: Image.asset(
                              widget.listOfPromo[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          18.horizontalSpace,
                          Expanded(
                            child: Column(
                              children: [
                                10.verticalSpace,
                                Text(
                                  widget.listOfPromo[index].title,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                10.verticalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 32.w),
                                  decoration: BoxDecoration(
                                    color: widget.listOfPromo[index].buyBackground,
                                    borderRadius:
                                    BorderRadius.circular(32),
                                  ),
                                  child: Text(
                                    "Buy Now",
                                    style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
